# flecs_nim 使用指南与项目维护

## 目录

1. [快速上手](#1-快速上手)
2. [导入方式](#2-导入方式)
3. [核心 API](#3-核心-api)
4. [高级 Nim 风格 API](#4-高级-nim-风格-api)
5. [回调函数](#5-回调函数)
6. [示例说明](#6-示例说明)
7. [更新 FLECS 版本](#7-更新-flecs-版本)
8. [项目维护](#8-项目维护)
9. [常见问题](#9-常见问题)

---

## 1. 快速上手

### 安装

```sh
nimble install https://github.com/lyj/flecs_nim
```

### 最小示例

```nim
import flecs

type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64

let world = ecs_init()
defer: discard ecs_fini(world)

discard ecs_component(world, Position)
discard ecs_component(world, Velocity)

let e = ecs_new(world)
ecs_add(world, e, Position)
ecs_set(world, e, Position, Position(x: 10, y: 20))

# 查询
let q = ecs_query(world, ecs_query_desc_t(
  terms: ecs_terms(
    ecs_term_t(id: ecs_id(Position)),
    ecs_term_t(id: ecs_id(Velocity)),
  ),
))

var it = ecs_query_iter(world, q)
while ecs_query_next(addr it):
  echo "匹配: ", it.count
```

### 编译运行

```sh
nim c -r main.nim
```

---

## 2. 导入方式

### 按需导入

| 方式 | 内容 | 适用场景 |
|------|------|----------|
| `import flecs` | **全部功能**（推荐） | 日常使用 |
| `import flecs/raw` | 仅原始 FFI（714 个 proc） | 与 C API 直接交互 |
| `import flecs/core` | 核心类型安全包装 | 需核心 ECS + 精简依赖 |
| `import flecs/high` | Nim 风格高级 API | 偏好面向对象风格 |

同时导入原始 FFI 和高级 API：

```nim
import flecs              # 编译 C 源码 + 原始 FFI + 核心包装
import flecs/high         # 高级 Nim 风格 API
```

---

## 3. 核心 API

核心 API 位于 `src/flecs/core.nim`，通过 `import flecs` 自动引入。

### 组件 ID

```nim
ecs_id(Position)    # 获取 Position 类型对应的 Flecs 组件 ID
```

`ecs_id` 是一个宏，声明并持有一个全局 `ecs_entity_t` 变量，跨 block 持久。

### 实体创建

```nim
ecs_new(world)                          # 创建空实体
ecs_new_w(world, Position)              # 创建并附带组件
ecs_entity(world, "Player")             # 创建命名实体
```

### 组件操作

```nim
ecs_add(world, e, Position)             # 添加组件
ecs_remove(world, e, Position)          # 移除组件
ecs_set(world, e, Position, val)        # 设置组件值
ecs_get(world, e, Position)             # 获取组件指针（只读）
ecs_get_mut(world, e, Position)         # 获取可变组件指针
ecs_has(world, e, Position)             # 检测实体是否拥有组件
ecs_owns(world, e, Position)            # 检测实体自身拥有（不含继承）
ecs_modified(world, e, Position)        # 通知组件已修改
ecs_ensure(world, e, Position)          # 确保组件存在
ecs_emplace(world, e, Position)         # 插入组件（无构造）
```

### 组件注册

```nim
ecs_component(world, Position)   # 注册组件，等价于 C 的 ECS_COMPONENT
ecs_tag(world, MyTag)            # 注册 tag（无数据组件）
```

### 单例操作

```nim
ecs_singleton_add(world, Gravity)
ecs_singleton_set(world, Gravity, val)
ecs_singleton_get(world, Gravity)
ecs_singleton_get_mut(world, Gravity)
ecs_singleton_modified(world, Gravity)
ecs_singleton_remove(world, Gravity)
```

### 查询 / 系统 / 观察者

```nim
# 查询
let q = ecs_query(world, ecs_query_desc_t(
  terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
))

# 系统
let sysId = ecs_system(world, ecs_system_desc_t(
  callback: mySystem,
  query: ecs_query_desc_t(terms: ...),
))

# 观察者
let obsId = ecs_observer(world, ecs_observer_desc_t(
  events: [EcsOnAdd, 0, 0, 0, 0, 0, 0, 0],
  callback: myObserver,
  query: ecs_query_desc_t(terms: ...),
))
```

### Terms 数组构建

```nim
ecs_terms(term1, term2)   # 构建 32 项数组，剩余归零
```

### 迭代辅助

```nim
ecs_iter_next(it)         # 推进迭代器，等价于 ecs_query_next
```

---

## 4. 高级 Nim 风格 API

高级 API 位于 `src/flecs/high.nim`，需显式导入：

```nim
import flecs
import flecs/high
```

### EcsWorld

| 方法 | 说明 |
|------|------|
| `newEcsWorld()` | 创建世界，作用域结束自动 `ecs_fini` |
| `world.entity("name")` | 创建命名实体 |
| `world.entity()` | 创建匿名实体 |
| `world.delete(e)` | 删除实体 |
| `world.isAlive(e)` | 实体是否存活 |
| `world.lookup(path)` | 路径查找实体 |
| `world.name(e)` | 获取实体名称 |
| `world.worldPtr` | 获取原始 C 指针 |
| `world.component(Position)` | 注册组件 + 缓存到 `compId` |
| `world.tag(MyTag)` | 注册 tag |

### 组件操作（模板方法）

```nim
world.add(e, Position)                    # 添加
world.remove(e, Position)                 # 移除
world.set(e, Position, Position(x:0, y:0))  # 设置值
world.get(e, Position)                    # 读取指针（只读）
world.getMut(e, Position)                 # 读取指针（可变）
world.has(e, Position)                    # 检测
world.owns(e, Position)                   # 检测自身拥有
world.modified(e, Position)               # 通知修改
world.ensure(e, Position)                 # 确保存在
world.emplace(e, Position)                # 插入无构造
```

### 组件 ID

```nim
compId(Position)   # 与 component(Position) 共享同一全局变量
```

`compId` 与 `core.nim` 的 `ecs_id` 是完全独立的宏。在高级 API 中统一使用 `compId`。

### 查询

```nim
let q = world.queryTerms(
  ecs_term_t(id: compId(Position)),
  ecs_term_t(id: compId(Velocity)),
)

# 方式一：items 迭代器
for it in q.items:
  var ents = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
  for i in 0 ..< it.count:
    let p = world.get(ents[i], Position)
    echo p.x

# 方式二：手动迭代
var it = q.queryIter()
while it.next():
  # 访问 it.count, it.entities
```

### 系统与 Pipeline

```nim
world.system(ecs_system_desc_t(...))
world.observer(ecs_observer_desc_t(...))
world.run(sysId, deltaTime = 0.0)
world.progress(deltaTime = 0.0)
```

### eachId 遍历

```nim
for it in world.eachId(compId(Position)):
  var ents = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
  for i in 0 ..< it.count:
    echo ents[i]
```

### RAII 生命周期

`EcsWorld` 和 `EcsQuery` 皆为 `object` 类型，带有 `=destroy` 钩子：

- `EcsWorld` → 离开作用域时自动调用 `ecs_fini`
- `EcsQuery` → 离开作用域时自动调用 `ecs_query_fini`

两者均禁止拷贝（`=copy` 设为编译错误）。通过 Nim 的移动语义转移所有权。

---

## 5. 回调函数

所有回调必须是模块级 `{.cdecl.}` proc，不能是闭包：

```nim
proc mySystem(it: ptr ecs_iter_t) {.cdecl.} =
  for i in 0 ..< it.count:
    let e = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)[i]
    let p = cast[ptr Position](ecs_get_mut_id(it.world, e, it.ids[0]))
    p.x += 1

let sysId = ecs_system(world, ecs_system_desc_t(
  callback: mySystem,
  query: ecs_query_desc_t(
    terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
  ),
))
discard ecs_run(world, sysId, 0.0, nil)
```

推荐的字段访问方式（避免直接访问 `it.ptrs`）：

```nim
# 安全方式：通过 ecs_get / ecs_get_mut 逐个实体访问
for i in 0 ..< it.count:
  let e = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)[i]
  let p = ecs_get(it.world, e, Position)       # 需要 ecs_id 宏
```

---

## 6. 示例说明

项目提供以下示例（`examples/`）：

| 示例 | 说明 | 适用 API |
|------|------|----------|
| `hello_world.nim` | 最简入门：创建世界、注册组件、遍历 | core |
| `entities/basics.nim` | 实体 CRUD、tag、组件类型查看 | core |
| `entities/hierarchy.nim` | 父子层级、路径查找 | core |
| `entities/iterate_components.nim` | 遍历实体的组件 ID 列表 | core |
| `queries/basics.nim` | 查询遍历 + 条件过滤 | core |
| `observers/basics.nim` | OnAdd/OnRemove 事件监听 | core |
| `systems/basics.nim` | 系统创建与 `ecs_run` | core |
| `relationships/basics.nim` | Pairs、通配符查询 | core |
| `reflection/basics.nim` | 组件元信息与序列化 | core |
| `highlevel.nim` | Nim 风格高级 API 完整示例 | high |

运行示例：

```sh
nim c -r --path:src examples/highlevel.nim
```

---

## 7. 更新 FLECS 版本

当上游 FLECS 发布新版本时，按以下步骤更新绑定。

### 7.1 更新子模块

```sh
# 拉取上游更新
cd flecs
git fetch origin
git checkout v4.2.0        # 替换为目标版本
cd ..

# 提交子模块更新
git add flecs
git commit -m "chore: update flecs to v4.2.0"
```

### 7.2 重新生成绑定

```sh
# 方式一：使用脚本
bash scripts/regenerate.sh

# 方式二：手动调用 Futhark
nim c -r -d:useFuthark flecs.nim
```

这会用 `wrappers/*.h` 下的包装头文件（利用 `FLECS_CUSTOM_BUILD`）分别生成各模块的 `*_raw.nim`。

### 7.3 清理废弃符号

```sh
# 先全量编译测试
nimble test

# 检查是否有符号变更导致测试失败
# 如果有废弃的 proc/type，更新 tests/test1.nim 和包装层
```

### 7.4 提交生成文件

```sh
git add src/flecs_nim/*_raw.nim
git commit -m "update: regenerate bindings for flecs v4.2.0"
```

**为什么提交生成文件？** 参见下方「文件提交策略」。

---

## 8. 项目维护

### 8.1 项目结构

```
flecs_nim/
├── flecs.nim                    # Futhark 驱动
├── flecs_nim.nimble             # Nimble 包配置 (srcDir = "src")
├── wrappers/                    # C 包装头文件（按 addon 分组）
│   ├── core.h                   #   核心 ECS
│   ├── meta.h                   #   反射
│   ├── json.h                   #   JSON
│   ├── http.h                   #   HTTP/REST
│   ├── script.h                 #   脚本
│   ├── alerts.h                 #   告警
│   ├── stats.h                  #   统计
│   └── app.h                    #   应用框架
├── scripts/
│   ├── generate.nim             # Futhark 生成脚本
│   └── regenerate.sh            # 一键重新生成
├── src/
│   ├── flecs_nim.nim            # 主入口
│    └── flecs/
│       ├── raw.nim              # [生成] 原始 FFI
│       ├── core.nim             # 核心包装（模板 + macro）
│       ├── high.nim             # 高级 Nim 风格 API
│       ├── meta.nim             # 反射
│       ├── json.nim             # JSON
│       ├── http.nim             # HTTP
│       ├── script.nim           # 脚本
│       ├── alerts.nim           # 告警
│       ├── stats.nim            # 统计
│       ├── app.nim              # 应用框架
│       └── all.nim              # 全模块快捷入口
├── tests/
│   ├── config.nims              # ASan 支持
│   ├── shared.nim               # 共享辅助
│   ├── tester.nim               # 自动发现运行器
│   ├── tcore.nim / tquery.nim / tsystem.nim
│   ├── tobserver.nim / tsingleton.nim / thigh.nim
│   ├── tmeta.nim / tjson.nim / tscript.nim
│   └── tedge.nim
├── examples/
│   ├── hello_world.nim          # 最简入门
│   ├── highlevel.nim            # 高级 API 示例
│   ├── entities/
│   ├── queries/
│   ├── systems/
│   ├── observers/
│   ├── relationships/
│   └── reflection/
└── README.md / README_zh.md / doc.md
```

### 8.2 添加新的包装层

为某个 addon（如 meta、json）添加 Nim 风格包装的流程：

1. **填充存根模块**：编辑对应的 `src/flecs/<addon>.nim`
2. **在 all.nim 中启用**：取消 `import <addon>` 的注释
3. **编写测试**：在 `tests/` 下添加 `t<addon>.nim`
4. **添加示例**：在 `examples/` 下添加对应示例

### 8.3 文件提交策略

| 文件 | 提交策略 | 原因 |
|------|----------|------|
| `src/flecs/raw.nim` | ✅ 提交到仓库 | 用户可能没有 Futhark/Clang |
| 其他 `*_raw.nim` | ✅ 提交到仓库 | 同上 |
| `src/flecs/*.nim`（手工编写） | ✅ 提交到仓库 | 核心代码 |
| `wrappers/*.h` | ✅ 提交到仓库 | 重新生成所需配置 |
| `scripts/*` | ✅ 提交到仓库 | 开发工具 |
| `flecs/distr/flecs.c` | ✅ 子模块 | 从上游仓库引用 |

### 8.4 添加新测试

```nim
# tests/tsystem.nim
import flecs

block system_test:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  # ... 测试代码
  doAssert condition

echo "system tests passed"
```

测试文件以 `t` 开头，`tester.nim` 会自动发现并运行。

**运行方式：**

```sh
nimble test              # debug 模式（默认）
nimble testRelease       # release 模式
nimble testDanger        # danger 模式
nimble testAsan          # AddressSanitizer（需 GCC/Clang 支持）
```

### 8.5 跨平台注意事项

| 平台 | 注意事项 |
|------|----------|
| Linux | 需安装 `clang libclang-dev`（重新生成时） |
| macOS | `xcode-select --install`（重新生成时） |
| Windows | 安装 LLVM + MSVC 构建工具 |

---

## 9. 常见问题

### Q: 为什么 `ecs_add(world, e, Position)` 不需要 `discard`？
模板返回 `void`，可直接作为语句。

### Q: `ecs_id(Position)` 和 `compId(Position)` 有什么区别？
`ecs_id` 来自 `core.nim`，`compId` 来自 `high.nim`。两者各自持有独立的全局变量。
若有 `import flecs/high`，使用 `compId`；否则使用 `ecs_id`。

### Q: 为什么 `world.component(Position)` 和 `world.set(e, Position, ...)` 不报错？
`component` 是 macro（返回 `ecs_entity_t`，可 discard），`set` 是 template（返回 void）。
若编译提示 `expression has no address`，应用 `var tmp = value; cast[pointer](addr tmp)` 模式。

### Q: 为什么回调函数不能用闭包？
Flecs C API 要求函数指针，Nim 闭包无法转换为 `cdecl` 函数指针。
回调必须是模块级 `{.cdecl.}` proc。

### Q: 更新 FLECS 版本时需要改什么？
通常只需要：
1. 更新子模块的 `flecs` 目录
2. 运行 `bash scripts/regenerate.sh`
3. 修复测试中因 API 变更导致的失败

### Q: 如何只导入自己需要的功能？
```nim
import flecs/raw          # 仅 FFI
import flecs/raw, core    # FFI + 核心包装
import flecs/high         # 高级 API（需配合 flecs_nim 编译 C 源码）
```

### Q: `EcsWorld` 为什么不能拷贝？
`EcsWorld` 持有 C 资源的 `ptr ecs_world_t`。拷贝会导致两个 object 持有同一指针，
其中一个析构时调用 `ecs_fini`，另一个留下悬空指针。通过 `=copy` 编译错误防止这种错误。
需要转移所有权时使用 Nim 的移动语义（ORC/ARC 自动处理）。

### Q: 为什么用 `template` 而不用 `proc`？
`compId(T)` 是宏，需要在调用处展开以正确绑定到调用模块的全局变量。
`proc` 体内的宏展开在 `high.nim` 模块自身作用域，创建的是独立全局变量。
`template` 在调用处原地展开，保证 `compId(T)` 与 `component(T)` 共享同一变量。

### Q: 如何调试 SIGABRT / SIGSEGV？
SIGABRT 通常来自 Flecs C 端的断言失败（如 ecs_id 为 0）。
SIGSEGV 通常来自空指针解引用（如 `ecs_get` 返回 nil 被访问）。
建议：
```nim
let cid = compId(Position)
echo "cid = ", cid          # 检查组件 ID 是否非零
let p = world.get(e, Position)
if p != nil: echo p.x       # 检查指针是否有效
```
