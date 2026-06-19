# flecs_nim —— FLECS 的 Nim 绑定

[Nim][nim] 语言对 [FLECS][flecs] v4.1.5 的绑定。FLECS 是一个用 C 编写的快速轻量级 ECS（实体组件系统）框架。

[nim]: https://nim-lang.org
[flecs]: https://github.com/SanderMertens/flecs

## 快速开始

```nim
import flecs_nim

type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64

# 初始化世界
var world = ecs_init()
defer: discard ecs_fini(world)

# 注册组件（等价于 C 的 ECS_COMPONENT 宏）
discard ecs_component(world, Position)
discard ecs_component(world, Velocity)

# 创建带组件的实体
let e = ecs_new(world)
ecs_add(world, e, Position)
ecs_add(world, e, Velocity)
ecs_set(world, e, Position, Position(x: 10, y: 20))

# 查询实体
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

## API 总览

### 类型安全封装（Nim 模板 —— 等价于 C 宏）

| Nim 调用 | C 等价物 |
|----------|---------|
| `ecs_component(world, Position)` | `ECS_COMPONENT(world, Position)` |
| `ecs_tag(world, MyTag)` | `ECS_TAG(world, MyTag)` |
| `ecs_add(world, e, Position)` | `ecs_add(world, e, Position)` |
| `ecs_set(world, e, Pos, Pos(x:1))` | `ecs_set(world, e, Position, {1, 0})` |
| `ecs_get(world, e, Position)` | `ecs_get(world, e, Position)` |
| `ecs_get_mut(world, e, Position)` | `ecs_get_mut(world, e, Position)` |
| `ecs_has(world, e, Position)` | `ecs_has(world, e, Position)` |
| `ecs_remove(world, e, Position)` | `ecs_remove(world, e, Position)` |
| `ecs_modified(world, e, Position)` | `ecs_modified(world, e, Position)` |
| `ecs_ensure(world, e, Position)` | `ecs_ensure(world, e, Position)` |
| `ecs_emplace(world, e, Position)` | `ecs_emplace(world, e, Position)` |
| `ecs_new_w(world, Position)` | `ecs_new_w(world, Position)` |
| `ecs_query(world, desc)` | `ecs_query(world, {...})` |
| `ecs_system(world, desc)` | `ecs_system(world, {...})` |
| `ecs_observer(world, desc)` | `ecs_observer(world, {...})` |
| `ecs_terms(term1, term2)` | `{ecs_id(X), ecs_id(Y)}` |
| `ecs_singleton_add(world, T)` | `ecs_singleton_add(world, T)` |
| `ecs_singleton_set(world, T, val)` | `ecs_singleton_set(world, T, ...)` |
| `ecs_singleton_get(world, T)` | `ecs_singleton_get(world, T)` |
| `ecs_id(Position)` | `ecs_id(Position)` |

所有原始 `ecs_*` proc（共 714 个）均可直接调用。

### 回调函数

回调必须是模块级 `{.cdecl.}` proc（不能是闭包）：

```nim
proc mySystem(it: ptr ecs_iter_t) {.cdecl.} =
  let p = cast[ptr UncheckedArray[Position]](
    cast[ptr UncheckedArray[pointer]](it.ptrs)[0])
  for i in 0 ..< it.count:
    p[i].x += 1

let sysId = ecs_system(world, ecs_system_desc_t(
  callback: mySystem,
  query: ecs_query_desc_t(terms: ecs_terms(ecs_term_t(id: ecs_id(Position)))),
))
discard ecs_run(world, sysId, 0.0, nil)
```

## 构建

### 示例

```sh
# 运行所有示例
for f in examples/**/*.nim; do nim c --path:src -r "$f"; done
```

```
examples/
├── hello_world.nim                # 最简入门
├── entities/
│   ├── basics.nim                 # 实体 CRUD、tag、组件类型查看
│   ├── hierarchy.nim              # 父子层级、路径查找
│   └── iterate_components.nim     # 遍历实体的组件 ID 列表
├── queries/
│   └── basics.nim                 # 遍历 + 条件过滤
├── observers/
│   └── basics.nim                 # OnAdd/OnRemove 事件监听
├── systems/
│   └── basics.nim                 # 系统创建与 ecs_run
├── relationships/
│   └── basics.nim                 # Pairs、通配符查询
└── reflection/
    └── basics.nim                 # 组件元信息与序列化
```

### 依赖

- Nim ≥ 2.2.8
- C 编译器（GCC / Clang / MSVC）
- [futhark][futhark]（可选，仅重新生成绑定时需要）

[futhark]: https://github.com/PMunch/futhark

### 编译与测试

```sh
nimble install
nimble test
```

重新从 `flecs.h` 生成原始绑定：

```sh
nim c -r -d:useFuthark flecs.nim
```

### 链接

FLECS 从随仓库分发的源码 `flecs/distr/flecs.c` 静态编译。系统库按平台自动链接：

| 平台 | 链接参数 |
|------|---------|
| Linux | `-lm -lpthread -ldl` |
| macOS | `-lm -lpthread -ldl` |
| Windows (MSVC) | `-lws2_32 -ldbghelp` |

## 项目结构

```
flecs_nim/
├── flecs.nim              # Futhark 驱动（重新生成原始绑定）
├── flecs_nim.nimble       # Nimble 包配置 (srcDir = "src")
├── README.md              # 英文文档
├── README_zh.md           # 中文文档（本文件）
├── flecs/                 # FLECS C 源码（git 子模块）
├── src/
│   ├── flecs_nim.nim      # 公开模块（链接标志 + raw 绑定 + 工效层）
│   └── flecs_nim_raw.nim  # Futhark 生成的原始 FFI（714 proc，~4100 行）
├── tests/
│   ├── config.nims        # 测试编译器配置
│   ├── test1.nim          # 冒烟测试（10 个 block，doAssert）
│   └── tester.nim         # 自动发现测试运行器
└── .github/workflows/
    └── ci.yml             # 跨平台 CI（Linux / macOS / Windows）
```

## 项目更新方案

本项目的目标是将 FLECS C 库以最小代价、最忠实的方式暴露给 Nim 用户。更新方案分三层推进：

### 第一阶段（已完成）—— 项目骨架与基础绑定

- ✅ 项目结构规范化（`src/` 目录、Nimble 配置对齐）
- ✅ Futhark 自动生成原始 FFI 绑定（714 个 proc）
- ✅ 跨平台链接（Linux / macOS / Windows MSVC）
- ✅ 冒烟测试（`tests/test1.nim`，10 个 block）
- ✅ 跨平台 CI（`.github/workflows/ci.yml`）
- ✅ 测试运行器（`tests/tester.nim`，自动发现 `t*.nim`）
- ✅ 中英文文档

### 第二阶段（已完成）—— C 宏的 Nim 等价物

- ✅ 类型安全 API：`ecs_add[T]`、`ecs_set[T]`、`ecs_get[T]`、`ecs_has[T]` 等
- ✅ 组件注册：`ecs_component` / `ecs_tag`（等价于 `ECS_COMPONENT` / `ECS_TAG`）
- ✅ 查询/系统/观察者声明式 API：`ecs_query` / `ecs_system` / `ecs_observer`
- ✅ 单例 API：`ecs_singleton_add/set/get/remove`
- ✅ Terms 数组辅助：`ecs_terms()`
- ✅ 查询迭代辅助：`ecs_iter_next()`
- ✅ 所有模板均有文档注释

### 第三阶段（待规划）—— 高级 API 与工效提升

- ~~`ecs_entity` 模板（命名实体快速创建）~~ —— 已修复！参数名 `entityName` 避免与 `ecs_entity_desc_t.name` 字段冲突
- 系统/观察者的 pipeline 集成（`ecs_progress` 自动调度）
- Nim 风格的对象包装（`EcsWorld` 含 `=destroy`、`EcsQuery` 等）—— 仅当用户需要时
- 更多 FLECS 模块支持（JSON / REST / HTTP / 反射等）—— 按需添加
- 每个模块独立的测试文件（`tquery.nim`、`tsystem.nim` 等）

### 技术决策记录

1. **为什么用 template 而非 generic proc？** —— `ecs_id` 宏在 generic proc 体内无法正确展开。template 在调用点原地展开，保证宏正确工作。
2. **为什么 `ecs_component` 每次都重新注册？** —— 跨 world 时全局变量残留旧 ID，导致组件失效。幂等注册确保每个 world 的组件 ID 正确。
3. **为什么 FLECS 源码从仓库编译？** —— 避免 system package 版本冲突。用户无需安装任何 C 依赖。
4. **`ecs_entity` 模板的命名冲突如何解决的？** —— 不是类型名冲突（与 `ecs_entity_t`），而是参数名 `name` 遮蔽了结构体字段 `ecs_entity_desc_t.name`。将参数改为 `entityName` 即可。
5. **为什么没有 Release workflow？** —— 这是一个库项目，没有可发布的二进制。通过 nimble 包管理器分发的源文件本身就是发布物。

## 许可证

MIT
