# Flecs Nim 示例

本目录包含 flecs_nim 的使用示例，按主题分类，与 [FLECS 官方 C 示例](https://github.com/SanderMertens/flecs/tree/master/examples/c) 结构对齐。

## 运行

从项目根目录运行任意示例：

```sh
nim c --path:src -r examples/entities/basics.nim
```

或一次性运行全部：

```sh
for f in examples/**/*.nim; do nim c --path:src -r "$f"; done
```

---

## hello_world.nim

最简入门示例。涵盖：

- 世界（world）的创建与销毁
- 组件注册（`ecs_component`）
- 命名实体创建（`ecs_entity`）
- 组件设值（`ecs_set`）
- 遍历拥有某组件的实体并修改（`ecs_each_id` + `ecs_get_mut`）

---

## entities/ —— 实体

### basics.nim

实体基本操作：

- 创建命名实体
- 添加/移除组件和 tag
- 读取和覆盖组件值
- 查看实体拥有的组件列表（`ecs_type_str`）
- 遍历拥有某组件的全部实体
- 删除实体（`ecs_delete`）

### hierarchy.nim

父子层级关系（ChildOf）：

- 通过 `ecs_entity_desc_t.parent` 创建父子关系
- 检测实体是否是另一个实体的子实体（`EcsChildOf` 关系）
- 层级路径查找（`ecs_lookup` + `ecs_get_path_w_sep`）
- 遍历某个父实体的所有子实体

### iterate_components.nim

检查实体拥有哪些组件：

- `ecs_type_str` 一次性打印全部组件
- `ecs_get_type` + `ecs_type_t.array` 逐个遍历组件 ID
- `ecs_id_str` 将组件 ID 转为可读字符串
- 也展示了组件实体自身拥有的元信息类型

---

## queries/ —— 查询

### basics.nim

实体筛选与遍历：

- 用 `ecs_each_id` 遍历拥有某组件的实体
- 用 `ecs_has_id` 做二次条件过滤（如「同时拥有 Position 和 Velocity」）
- 统计满足条件的实体数量
- 等价于 C 中 `ecs_query` + `ecs_each` 的模式

---

## observers/ —— 观察者

### basics.nim

监听组件生命周期事件：

- 注册 OnAdd observer：当实体添加 Health 组件时触发回调
- 注册 OnRemove observer：当实体移除 Health 组件时触发回调
- 通过 `ecs_progress` 处理事件
- 回调必须是 `{.cdecl.}` 的模块级 proc（不能是闭包）

---

## systems/ —— 系统

### basics.nim

系统（System）创建与执行：

- 用 `ecs_system` 声明式创建系统
- 系统描述符中包含回调 + 查询条件（`ecs_query_desc_t`）
- 用 `ecs_run` 手动执行系统
- 注意事项：`ecs_run` 中 `it.ptrs` 可能为 nil，生产代码建议使用 `ecs_progress` + pipeline 或 per-entity `ecs_get`

---

## relationships/ —— 关系

### basics.nim

实体关系（Pairs）：

- 用 `ecs_make_pair` 构建 (关系, 目标) 对
- 用 `ecs_has_id` 检查实体是否拥有某个关系
- 通配符 `EcsWildcard` 匹配任意关系目标
- 关系会显示在 `ecs_type_str` 输出中，格式为 `(关系,目标)`

---

## reflection/ —— 反射

### basics.nim

组件元信息与序列化：

- 为已有组件添加结构体描述（字段名 + 类型）
- 使用 FLECS 内置类型 `ecs_f32_t` 等作为字段类型
- 用 `ecs_ptr_to_expr` 将组件值序列化为表达式字符串（如 `{x: 10, y: 20}`）
- 与 C 示例中 `ecs_struct` + `ecs_ptr_to_expr` 等价

---

## 常见模式

### 组件操作

```nim
discard ecs_component(world, Position)           # 注册
let e = ecs_entity(world, "Bob")                 # 创建命名实体
ecs_set(world, e, Position, Position(x: 1, y: 2)) # 设值
let p = ecs_get(world, e, Position)              # 读取
let pm = ecs_get_mut(world, e, Position)          # 可变读取
ecs_has(world, e, Position)                       # 检测
ecs_remove(world, e, Position)                    # 移除
```

### 遍历实体

```nim
var it = ecs_each_id(world, ecs_id(Position))
while ecs_each_next(addr it):
  let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
  for i in 0 ..< it.count:
    let e = entities[i]
    let pos = ecs_get(world, e, Position)
    echo pos.x
```

### 回调函数

```nim
proc myCallback(it: ptr ecs_iter_t) {.cdecl.} =
  # 必须是 .cdecl，必须在模块顶级定义（非闭包）
  let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
  for i in 0 ..< it.count:
    echo "entity: ", entities[i]
```
