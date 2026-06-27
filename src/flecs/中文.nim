## Flecs Nim 中文包装 · 完整版
##
## 遵循《中文代码命名通用规范 — Nim 版》的个人风格包装。
## 涵盖全部 ECS 操作 + CODING_STANDARD.md 通用宏。
##
## 使用方式：
##   import flecs
##   import flecs/中文
##
##   let 世界 = 新建世界()
##   世界.注册组件(Position)
##   世界.注册组件(Velocity)
##   let 实体 = 世界.创建命名实体("玩家")
##   世界.设置组件(实体, Position, Position(x: 10, y: 20))
##   if 世界.是否拥有组件(实体, Position):
##     echo 世界.获取组件(实体, Position).x

import std/[macros, times, strformat, tables, options, strutils]
import raw
import core

# ══════════════════════════════════════════════════════════════════════
# 第一部分：CODING_STANDARD.md 通用宏
# ══════════════════════════════════════════════════════════════════════

# ─── 1.1 定义Distinct类型 ───────────────────────────────────────────

macro 定义Distinct类型*(类型名, 底层类型: untyped): untyped =
  ## 一行定义 distinct 类型，自动生成 borrow、$、转换、比较运算符。
  let 底层名 = $底层类型
  let 转换名 = ident("to" & 底层名)
  result = quote do:
    type `类型名`* = distinct `底层类型`
    proc `$`*(x: `类型名`): string = `$`(`底层类型`(x))
    converter `转换名`*(x: `类型名`): `底层类型` = `底层类型`(x)
    proc `==`*(a, b: `类型名`): bool {.borrow.}
    proc `<`*(a, b: `类型名`): bool {.borrow.}
    proc `<=`*(a, b: `类型名`): bool {.borrow.}

# ─── 1.2 定义实体 —— 对象 + 存储 + CRUD ───────────────────────────

macro 定义实体*(实体名, 字段定义: untyped): untyped =
  ## 从字段定义自动生成对象类型 + 存储 + 查询/保存/删除/列表 proc。
  let 字段列表 = 字段定义[0]
  var 字段声明 = nnkRecList.newTree()
  let 存储名 = ident($实体名 & "存储")
  let 表名 = ident($实体名 & "表")
  let 实体名str = $实体名
  var id字段名: NimNode
  var id字段类型: NimNode
  var 是否第一个 = true
  for 字段 in 字段列表:
    if 字段.kind == nnkIdentDefs:
      字段声明.add nnkIdentDefs.newTree(字段[0], 字段[1], newEmptyNode())
      if 是否第一个:
        id字段名 = 字段[0]; id字段类型 = 字段[1]; 是否第一个 = false
  let 查询名 = ident("查询" & 实体名str)
  let 保存名 = ident("保存" & 实体名str)
  let 删除名 = ident("删除" & 实体名str)
  let 列表名 = ident("列表" & 实体名str)
  # 手工构建 AST 避免 quote do 里反引号冲突
  result = newStmtList()
  # type 实体名 = object ...
  var 对象类型 = nnkTypeSection.newTree(
    nnkTypeDef.newTree(实体名, newEmptyNode(), nnkObjectTy.newTree(
      newEmptyNode(), newEmptyNode(), 字段声明)))
  result.add 对象类型
  # type 存储名 = object 表名: Table[id字段类型, 实体名]
  var 表字段 = nnkIdentDefs.newTree(表名,
    nnkBracketExpr.newTree(ident("Table"), id字段类型, 实体名), newEmptyNode())
  var 存储类型 = nnkTypeSection.newTree(
    nnkTypeDef.newTree(存储名, newEmptyNode(), nnkObjectTy.newTree(
      newEmptyNode(), newEmptyNode(), nnkRecList.newTree(表字段))))
  result.add 存储类型
  # proc 查询
  var 查询体 = nnkIfStmt.newTree(
    nnkElifBranch.newTree(
      nnkInfix.newTree(ident("in"), ident("id"), nnkBracketExpr.newTree(ident"存储", 表名)),
      nnkAsgn.newTree(ident"result", nnkCall.newTree(ident"some", nnkBracketExpr.newTree(
        nnkBracketExpr.newTree(ident"存储", 表名), ident"id"))))))
  result.add nnkProcDef.newTree(newEmptyNode(), newEmptyNode(), 查询名,
    newEmptyNode(), nnkFormalParams.newTree(
      nnkBracketExpr.newTree(ident"Option", 实体名),
      nnkIdentDefs.newTree(ident"存储", nnkBracketExpr.newTree(ident"var", 存储名), newEmptyNode()),
      nnkIdentDefs.newTree(ident"id", id字段类型, newEmptyNode())),
    newEmptyNode(), newEmptyNode(), newStmtList(查询体))
  # proc 保存
  var 保存体 = nnkAsgn.newTree(
    nnkBracketExpr.newTree(nnkBracketExpr.newTree(ident"存储", 表名),
      nnkDotExpr.newTree(ident"实体", id字段名)), ident"实体")
  result.add nnkProcDef.newTree(newEmptyNode(), newEmptyNode(), 保存名,
    newEmptyNode(), nnkFormalParams.newTree(
      ident"void",
      nnkIdentDefs.newTree(ident"存储", nnkBracketExpr.newTree(ident"var", 存储名), newEmptyNode()),
      nnkIdentDefs.newTree(ident"实体", 实体名, newEmptyNode())),
    newEmptyNode(), newEmptyNode(), newStmtList(保存体))
  # proc 删除
  var 删除条件 = nnkInfix.newTree(ident"in", ident"id", nnkBracketExpr.newTree(ident"存储", 表名))
  var 删除体 = nnkIfStmt.newTree(
    nnkElifBranch.newTree(删除条件, newStmtList(
      nnkCall.newTree(nnkDotExpr.newTree(nnkBracketExpr.newTree(ident"存储", 表名), ident"del"), ident"id"),
      nnkAsgn.newTree(ident"result", ident"true"))))
  result.add nnkProcDef.newTree(newEmptyNode(), newEmptyNode(), 删除名,
    newEmptyNode(), nnkFormalParams.newTree(
      ident"bool",
      nnkIdentDefs.newTree(ident"存储", nnkBracketExpr.newTree(ident"var", 存储名), newEmptyNode()),
      nnkIdentDefs.newTree(ident"id", id字段类型, newEmptyNode())),
    newEmptyNode(), newEmptyNode(), newStmtList(删除体))
  # proc 列表
  var 列表体 = newStmtList()
  var for循环 = nnkForStmt.newTree(
    ident"实体值",
    nnkCall.newTree(nnkDotExpr.newTree(nnkBracketExpr.newTree(ident"存储", 表名), ident"values")),
    newStmtList(nnkCall.newTree(nnkDotExpr.newTree(ident"result", ident"add"), ident"实体值"))))
  列表体.add for循环
  result.add nnkProcDef.newTree(newEmptyNode(), newEmptyNode(), 列表名,
    newEmptyNode(), nnkFormalParams.newTree(
      nnkBracketExpr.newTree(ident"seq", 实体名),
      nnkIdentDefs.newTree(ident"存储", nnkBracketExpr.newTree(ident"var", 存储名), newEmptyNode())),
    newEmptyNode(), newEmptyNode(), 列表体)

# ─── 1.3 定义状态机 ────────────────────────────────────────────────

macro 定义状态机*(类型名, 初始状态, 转换规则: untyped): untyped =
  ## 声明式定义状态机，生成状态枚举 + 转换 proc + 可能转换 proc。
  var 状态集合: seq[string]
  var 转换表: seq[(string, string)]
  for 规则 in 转换规则:
    if 规则.kind == nnkInfix and $规则[0] == "→":
      let 从 = $规则[1]; let 到 = $规则[2]
      if 从 notin 状态集合: 状态集合.add 从
      if 到 notin 状态集合: 状态集合.add 到
      转换表.add((从, 到))
  var 枚举成员 = nnkEnumTy.newTree()
  for s in 状态集合: 枚举成员.add ident(s)
  let 枚举名 = ident($类型名 & "状态")
  let 转换名 = ident("尝试转换" & $类型名)
  let 可能名 = ident("可能转换" & $类型名)
  # 构建 case 分支
  var 分支列表 = nnkCaseStmt.newTree(nnkDotExpr.newTree(ident"实体", ident"状态"))
  for s in 状态集合:
    var 内部语句 = newStmtList()
    for (从, 到) in 转换表:
      if 从 == s:
        内部语句.add newStmtList(
          nnkIfStmt.newTree(
            nnkElifBranch.newTree(
              nnkInfix.newTree(ident"==", ident"新状态", ident(到)),
              newStmtList(
                nnkAsgn.newTree(nnkDotExpr.newTree(ident"实体", ident"状态"), ident(到)),
                nnkAsgn.newTree(ident"result", ident"true")),
            )))
    分支列表.add nnkOfBranch.newTree(ident(s), 内部语句)
  # 构建枚举类型定义
  var 枚举类型 = nnkTypeSection.newTree(
    nnkTypeDef.newTree(枚举名, newEmptyNode(), 枚举成员))
  # 构建转换 proc
  var 转换体 = newStmtList()
  转换体.add 分支列表
  转换体.add nnkAsgn.newTree(ident"result", ident"false")
  var 转换proc = nnkProcDef.newTree(newEmptyNode(), newEmptyNode(), 转换名,
    newEmptyNode(), nnkFormalParams.newTree(ident"bool",
      nnkIdentDefs.newTree(ident"实体", nnkBracketExpr.newTree(ident"var", 类型名), newEmptyNode()),
      nnkIdentDefs.newTree(ident"新状态", 枚举名, newEmptyNode())),
    newEmptyNode(), newEmptyNode(), 转换体)
  # 构建可能转换 proc
  var 可能体 = newStmtList()
  可能体.add nnkAsgn.newTree(ident"result", nnkBracketExpr.newTree(ident"@", newEmptyNode()))
  for (从, 到) in 转换表:
    可能体.add nnkIfStmt.newTree(
      nnkElifBranch.newTree(
        nnkInfix.newTree(ident"==", nnkDotExpr.newTree(ident"实体", ident"状态"), ident(从)),
        newStmtList(nnkCall.newTree(nnkDotExpr.newTree(ident"result", ident"add"), ident(到))))))
  var 可能proc = nnkProcDef.newTree(newEmptyNode(), newEmptyNode(), 可能名,
    newEmptyNode(), nnkFormalParams.newTree(
      nnkBracketExpr.newTree(ident"seq", 枚举名),
      nnkIdentDefs.newTree(ident"实体", 类型名, newEmptyNode())),
    newEmptyNode(), newEmptyNode(), 可能体)
  result = newStmtList(枚举类型, 转换proc, 可能proc)

# ─── 1.4 中文 DSL ──────────────────────────────────────────────────

template 若*(条件: bool; 则: untyped) =
  if 条件: 则

template 若*(条件: bool; 则, 否则: untyped) =
  if 条件: 则 else: 否则

macro 遍历*(迭代变量, 集合: untyped; 主体: untyped): untyped =
  result = nnkForStmt.newTree(迭代变量, 集合, 主体)

macro 当*(条件: untyped; 主体: untyped): untyped =
  result = nnkWhileStmt.newTree(条件, 主体)

# ─── 1.5 统计耗时 / 以重试执行 ────────────────────────────────────

template 统计耗时*(标签: string, 主体: untyped) =
  let 开始时间 = cpuTime()
  主体
  let 耗时 = cpuTime() - 开始时间
  echo &"[{标签}] 耗时: {耗时:.3f} 秒"

template 以重试执行*(最大重试次数: int, 主体: untyped) =
  block:
    var 已重试次数 = 0
    var 是否成功 = false
    while 已重试次数 <= 最大重试次数 and not 是否成功:
      try: 主体; 是否成功 = true
      except CatchableError as e:
        已重试次数 += 1
        if 已重试次数 > 最大重试次数: raise
        echo &"重试 {已重试次数}/{最大重试次数}: {e.msg}"

# ─── 1.6 强制命名检查 ─────────────────────────────────────────────

macro 强制命名检查*(主体: untyped): untyped =
  var 错误列表: seq[string]
  proc 检查节点(节点: NimNode) =
    case 节点.kind
    of nnkVarSection, nnkLetSection:
      for 定义 in 节点:
        if 定义.kind == nnkIdentDefs:
          let 变量名 = $定义[0]; let 类型节点 = 定义[1]
          if 类型节点.kind == nnkIdent and $类型节点 == "bool":
            if not 变量名.startsWith("是否"):
              错误列表.add "布尔变量 `" & 变量名 & "` 必须以 `是否` 开头"
          if 类型节点.kind == nnkBracketExpr and $类型节点[0] == "seq":
            if not (变量名.endsWith("列表") or 变量名.endsWith("集合")):
              错误列表.add "seq 变量 `" & 变量名 & "` 应以 `列表`/`集合` 结尾"
    else:
      for 子 in 节点.children: 检查节点(子)
  检查节点(主体)
  if 错误列表.len > 0: error(错误列表.join("\n"), 主体)
  result = 主体

# ══════════════════════════════════════════════════════════════════════
# 第二部分：ECS 组件 ID
# ══════════════════════════════════════════════════════════════════════

macro 组件ID*(T: typedesc): untyped =
  ## 获取 Nim 类型对应的 Flecs 组件 ID（与 ecs_id 共用全局变量）。
  let 类型名 = T.repr
  let id名 = ident("FLECS_ID" & 类型名 & "ID_")
  result = quote do:
    when not declared(`id名`):
      var `id名` {.global.}: ecs_entity_t
    `id名`

# ══════════════════════════════════════════════════════════════════════
# 第三部分：EcsWorld — 世界
# ══════════════════════════════════════════════════════════════════════

type
  世界* = object
    ## ECS 世界。作用域结束自动 ecs_fini。不可拷贝。
    内部*: ptr ecs_world_t

proc `=destroy`*(w: var 世界) =
  if w.内部 != nil: discard ecs_fini(w.内部); w.内部 = nil

proc `=copy`*(dst: var 世界; src: 世界) {.error: "世界不可拷贝".}

proc 新建世界*(): 世界 =
  result.内部 = ecs_init()

proc 原始指针*(w: 世界): ptr ecs_world_t =
  w.内部

# ─── 实体生命周期 ───────────────────────────────────────────────────

proc 创建命名实体*(w: 世界; 名称: string): ecs_entity_t =
  var 描述 = ecs_entity_desc_t(name: cstring(名称))
  result = ecs_entity_init(w.内部, addr 描述)

proc 创建匿名实体*(w: 世界): ecs_entity_t =
  result = ecs_new(w.内部)

proc 删除实体*(w: 世界; e: ecs_entity_t) =
  ecs_delete(w.内部, e)

proc 是否存活*(w: 世界; e: ecs_entity_t): bool =
  result = ecs_is_alive(w.内部, e)

proc 查找实体*(w: 世界; 路径: string): ecs_entity_t =
  result = ecs_lookup(w.内部, cstring(路径))

proc 获取实体名称*(w: 世界; e: ecs_entity_t): string =
  result = $ecs_get_name(w.内部, e)

# ─── 组件注册 ───────────────────────────────────────────────────────

macro 注册组件*(w: 世界; T: typedesc): untyped =
  let 类型名 = T.repr
  let id名 = ident("FLECS_ID" & 类型名 & "ID_")
  result = quote do:
    when not declared(`id名`):
      var `id名` {.global.}: ecs_entity_t
    if `id名` == 0:
      var edesc = ecs_entity_desc_t(
        name: cstring(`类型名`), symbol: cstring(`类型名`), use_low_id: true)
      var compDesc = ecs_component_desc_t(
        entity: ecs_entity_init(`w`.内部, addr edesc),
        type_field: ecs_type_info_t(
          size: ecs_size_t(sizeof(`T`)), alignment: ecs_size_t(alignof(`T`))))
      `id名` = ecs_component_init(`w`.内部, addr compDesc)

macro 注册标签*(w: 世界; T: typedesc): untyped =
  let 类型名 = T.repr
  let id名 = ident("FLECS_ID" & 类型名 & "ID_")
  result = quote do:
    when not declared(`id名`): var `id名` {.global.}: ecs_entity_t
    if `id名` == 0:
      var edesc = ecs_entity_desc_t(name: cstring(`类型名`))
      `id名` = ecs_entity_init(`w`.内部, addr edesc)

# ─── 组件操作 ───────────────────────────────────────────────────────

template 添加组件*(w: 世界; e: ecs_entity_t; T: typedesc) =
  ecs_add_id(w.内部, e, 组件ID(T))

template 移除组件*(w: 世界; e: ecs_entity_t; T: typedesc) =
  ecs_remove_id(w.内部, e, 组件ID(T))

template 设置组件*(w: 世界; e: ecs_entity_t; T: typedesc; 值: T) =
  var 临时 = 值
  ecs_set_id(w.内部, e, 组件ID(T), csize_t(sizeof(T)), cast[pointer](addr 临时))

template 获取组件*(w: 世界; e: ecs_entity_t; T: typedesc): ptr T =
  cast[ptr T](ecs_get_id(w.内部, e, 组件ID(T)))

template 获取可变组件*(w: 世界; e: ecs_entity_t; T: typedesc): ptr T =
  cast[ptr T](ecs_get_mut_id(w.内部, e, 组件ID(T)))

template 是否拥有组件*(w: 世界; e: ecs_entity_t; T: typedesc): bool =
  ecs_has_id(w.内部, e, 组件ID(T))

template 是否自身拥有组件*(w: 世界; e: ecs_entity_t; T: typedesc): bool =
  ecs_owns_id(w.内部, e, 组件ID(T))

template 通知组件已修改*(w: 世界; e: ecs_entity_t; T: typedesc) =
  ecs_modified_id(w.内部, e, 组件ID(T))

template 确保组件存在*(w: 世界; e: ecs_entity_t; T: typedesc): ptr T =
  cast[ptr T](ecs_ensure_id(w.内部, e, 组件ID(T), csize_t(sizeof(T))))

template 插入无构造组件*(w: 世界; e: ecs_entity_t; T: typedesc): ptr T =
  var 是否新建: bool
  cast[ptr T](ecs_emplace_id(w.内部, e, 组件ID(T), csize_t(sizeof(T)), addr 是否新建))

# ─── 单例操作 ──────────────────────────────────────────────────────

template 添加单例*(w: 世界; T: typedesc) =
  ecs_add_id(w.内部, 组件ID(T), 组件ID(T))

template 移除单例*(w: 世界; T: typedesc) =
  ecs_remove_id(w.内部, 组件ID(T), 组件ID(T))

template 设置单例*(w: 世界; T: typedesc; 值: T) =
  var 临时 = 值
  ecs_set_id(w.内部, 组件ID(T), 组件ID(T), csize_t(sizeof(T)), cast[pointer](addr 临时))

template 获取单例*(w: 世界; T: typedesc): ptr T =
  cast[ptr T](ecs_get_id(w.内部, 组件ID(T), 组件ID(T)))

template 获取可变单例*(w: 世界; T: typedesc): ptr T =
  cast[ptr T](ecs_get_mut_id(w.内部, 组件ID(T), 组件ID(T)))

template 通知单例已修改*(w: 世界; T: typedesc) =
  ecs_modified_id(w.内部, 组件ID(T), 组件ID(T))

# ══════════════════════════════════════════════════════════════════════
# 第四部分：查询
# ══════════════════════════════════════════════════════════════════════

type
  查询* = object
    世界: ptr ecs_world_t
    内部: ptr ecs_query_t

proc `=destroy`*(q: var 查询) =
  if q.内部 != nil: ecs_query_fini(q.内部); q.内部 = nil

proc 按条件查询*(w: 世界; 条件: varargs[ecs_term_t]): 查询 =
  var d: ecs_query_desc_t
  for i, t in 条件: d.terms[i] = t
  result = 查询(世界: w.内部, 内部: ecs_query_init(w.内部, addr d))

proc 按表达式查询*(w: 世界; 表达式: string): 查询 =
  var d = ecs_query_desc_t(expr: cstring(表达式))
  result = 查询(世界: w.内部, 内部: ecs_query_init(w.内部, addr d))

# ══════════════════════════════════════════════════════════════════════
# 第五部分：迭代器
# ══════════════════════════════════════════════════════════════════════

type
  迭代器* = object
    internal: ecs_iter_t

proc 计数*(it: 迭代器): int32 = it.internal.count

proc 实体列表*(it: 迭代器): ptr ecs_entity_t = it.internal.entities

proc 字段*(it: 迭代器; T: typedesc; idx: Natural = 0): ptr UncheckedArray[T] =
  if it.internal.ptrs == nil: result = nil
  else: result = cast[ptr UncheckedArray[T]](
    cast[ptr UncheckedArray[pointer]](it.internal.ptrs)[idx])

proc 推进*(it: var 迭代器): bool =
  result = ecs_query_next(addr it.internal)

proc 开始遍历*(q: 查询): 迭代器 =
  result = 迭代器(internal: ecs_query_iter(q.世界, q.内部))

iterator items*(q: 查询): 迭代器 =
  var it: 迭代器
  it.internal = ecs_query_iter(q.世界, q.内部)
  while ecs_query_next(addr it.internal): yield it

# ══════════════════════════════════════════════════════════════════════
# 第六部分：系统 / 观察者 / Pipeline
# ══════════════════════════════════════════════════════════════════════

type
  系统函数* = proc (it: ptr ecs_iter_t) {.cdecl.}
  观察者函数* = proc (it: ptr ecs_iter_t) {.cdecl.}

proc 创建系统*(w: 世界; 描述: ecs_system_desc_t): ecs_entity_t =
  var d = 描述; result = ecs_system_init(w.内部, addr d)

proc 创建观察者*(w: 世界; 描述: ecs_observer_desc_t): ecs_entity_t =
  var d = 描述; result = ecs_observer_init(w.内部, addr d)

proc 运行系统*(w: 世界; 系统ID: ecs_entity_t; 时间差: float64 = 0.0) =
  discard ecs_run(w.内部, 系统ID, cfloat(时间差), nil)

proc 推进一帧*(w: 世界; 时间差: float64 = 0.0) =
  discard ecs_progress(w.内部, cfloat(时间差))

# ══════════════════════════════════════════════════════════════════════
# 第七部分：遍历所有实体（按组件ID）
# ══════════════════════════════════════════════════════════════════════

iterator 按ID遍历*(w: 世界; 组件ID: ecs_id_t): 迭代器 =
  var it = ecs_each_id(w.内部, 组件ID)
  while ecs_each_next(addr it): yield 迭代器(internal: it)

# ══════════════════════════════════════════════════════════════════════
# 第八部分：常用别名
# ══════════════════════════════════════════════════════════════════════

type
  实体ID* = ecs_entity_t
  组件类型ID* = ecs_id_t
