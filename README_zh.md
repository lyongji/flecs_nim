# flecs —— FLECS 的 Nim 绑定

[Nim][nim] 语言对 [FLECS][flecs] v4.1.5 的绑定。FLECS 是一个用 C 编写的快速轻量级 ECS（实体组件系统）框架。

[nim]: https://nim-lang.org
[flecs]: https://github.com/SanderMertens/flecs

## 导入方式

| 方式 | 内容 | 适用场景 |
|------|------|----------|
| `import flecs` | **全部功能**（推荐） | 日常使用 |
| `import flecs/core` | 仅核心包装（实体、组件、查询、系统） | 精简依赖 |
| `import flecs/high` | Nim 风格高级 API（RAII） | 偏好面向对象风格 |
| `import flecs/raw` | 仅原始 FFI（714 个 `ecs_*` proc） | 与 C API 交互 |
| `import flecs/meta` | 反射/元数据 | 运行时类型检查、序列化 |
| `import flecs/json` | JSON 序列化 | 实体/世界 ↔ JSON |
| `import flecs/http` | HTTP 服务器 + REST API | 远程调试 |
| `import flecs/script` | Flecs 脚本 | 声明式实体创建 |
| `import flecs/alerts` | 告警监控 | 组件条件监控 |
| `import flecs/stats` | 运行时统计 | 性能分析 |
| `import flecs/app` | 应用框架 | 主循环/窗口管理 |

## 快速开始

### 核心 API（模板风格）

```nim
import flecs

type Position = object
  x, y: float64

var world = ecs_init()
defer: discard ecs_fini(world)

discard ecs_component(world, Position)
let e = ecs_new(world)
ecs_add(world, e, Position)
ecs_set(world, e, Position, Position(x: 10, y: 20))

let q = ecs_query(world, ecs_query_desc_t(
  terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
))
var it = ecs_query_iter(world, q)
while ecs_query_next(addr it):
  echo "匹配: ", it.count
```

### 高级 API（RAII 风格）

```nim
import flecs
import flecs/high

let world = newEcsWorld()
world.component(Position)
let e = world.entity("Bob")
world.set(e, Position, Position(x: 10, y: 20))
echo world.get(e, Position).x
```

## 模块架构

```
  导入层         包装层                 FFI 层              C 层
┌──────────┐   ┌──────────────────┐   ┌──────────────┐   ┌──────────────┐
│  flecs   │──▶│  core.nim        │──▶│  raw.nim     │──▶│  flecs.c/h   │
│ (主入口)  │   │  high.nim        │   │  [生成]      │   │  (子模块)    │
│          │   │  meta / json     │   │  *_raw.nim   │   │              │
│          │   │  http / script / │   │              │   │              │
│          │   │  alerts / stats  │   │              │   │              │
│          │   │  app             │   │              │   │              │
└──────────┘   └──────────────────┘   └──────────────┘   └──────────────┘
```

## 测试

```sh
nimble test              # debug 模式
nimble testRelease       # release 模式
nimble testDanger        # danger 模式
nimble testAsan          # AddressSanitizer
```

10 个自动发现的测试文件覆盖：核心 ECS、查询、系统、观察者、单例、高级 API、反射、JSON、脚本、边界情况。
测试运行器见 `tests/tester.nim`，ASan 配置见 `tests/config.nims`。

## 项目结构

```
flecs/
├── flecs.nim                 # Futhark 驱动
├── flecs_nim.nimble          # Nimble 包配置 (srcDir = "src")
├── doc.md                    # 中文使用指南+维护手册
├── flecs/                    # FLECS C 源码（git 子模块）
├── wrappers/                 # C 包装头文件，按 addon 分组
├── scripts/
│   └── regenerate.sh         # 一键重新生成
├── src/
│   ├── flecs.nim             # 主入口（编译/链接 + 导出全模块）
│   └── flecs/
│       ├── raw.nim           # [生成] 原始 FFI
│       ├── core.nim          # 核心类型安全包装（模板）
│       ├── high.nim          # 高级 Nim 风格 API（RAII 对象）
│       ├── meta.nim          # 反射 addon
│       ├── json.nim          # JSON addon
│       ├── http.nim          # HTTP addon
│       ├── script.nim        # 脚本 addon
│       ├── alerts.nim        # 告警 addon
│       ├── stats.nim         # 统计 addon
│       ├── app.nim           # 应用框架 addon
│       └── all.nim           # 全模块导入快捷入口
├── examples/
│   ├── hello_world.nim       # 最简入门（核心 API）
│   ├── highlevel.nim         # 高级 API 完整示例
│   ├── entities/             # 实体操作
│   ├── queries/              # 查询
│   ├── systems/              # 系统
│   ├── observers/            # 观察者
│   ├── relationships/        # 关系
│   └── reflection/           # 反射
├── tests/
│   ├── config.nims           # ASan 支持
│   ├── shared.nim            # 共享测试辅助
│   ├── tester.nim            # 自动发现运行器
│   ├── tcore.nim             # 核心 ECS（12 测试块）
│   ├── tquery.nim            # 查询（6 测试块）
│   ├── tsystem.nim           # 系统（2 测试块）
│   ├── tobserver.nim         # 观察者（4 测试块）
│   ├── tsingleton.nim        # 单例（3 测试块）
│   ├── thigh.nim             # 高级 API（13 测试块）
│   ├── tmeta.nim             # 反射/元数据（4 测试块）
│   ├── tjson.nim             # JSON 序列化（2 测试块）
│   ├── tscript.nim           # Flecs 脚本（2 测试块）
│   └── tedge.nim             # 边界情况（5 测试块）
├── README.md / README_zh.md
└── .github/workflows/
    └── ci.yml                # Nim 2.2.8 + stable, 3 构建模式, 3 平台
```

## 许可证

MIT
