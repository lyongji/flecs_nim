# flecs — Nim bindings for FLECS

[Nim][nim] bindings for [FLECS][flecs] v4.1.5, a fast and lightweight Entity Component System written in C.

[nim]: https://nim-lang.org
[flecs]: https://github.com/SanderMertens/flecs

## Import

| Import | What you get |
|--------|-------------|
| `import flecs` | **Everything** (recommended) — raw FFI + core wrappers + all addons |
| `import flecs/raw` | Raw FFI only (714 `ecs_*` procs) |
| `import flecs/core` | Core type-safe wrappers only |
| `import flecs/high` | Nim-style high-level API (RAII, opt-in) |
| `import flecs/meta` | Reflection / metadata |
| `import flecs/json` | JSON serialization |
| `import flecs/http` | HTTP server + REST API |
| `import flecs/script` | Flecs script execution |

## Quick Start

### Core API (template style)

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
  echo "matched: ", it.count
```

### High-level API (RAII style)

```nim
import flecs
import flecs/high

let world = newEcsWorld()
world.component(Position)
let e = world.entity("Bob")
world.set(e, Position, Position(x: 10, y: 20))
echo world.get(e, Position).x
```

## Module Architecture

```
  Import              Wrapper Layer             FFI Layer              C
┌──────────┐   ┌──────────────────────┐   ┌───────────────┐   ┌──────────────┐
│  flecs   │──▶│  core.nim            │──▶│  raw.nim      │──▶│  flecs.c/h   │
│ (entry)  │   │  high.nim            │   │  *_raw.nim    │   │  (submodule) │
│          │   │  meta.nim / json.nim │   │  [generated]  │   │              │
│          │   │  http / script / ... │   │               │   │              │
└──────────┘   └──────────────────────┘   └───────────────┘   └──────────────┘
```

## Testing

```sh
nimble test              # debug mode
nimble testRelease       # release mode
nimble testDanger        # danger mode
nimble testAsan          # AddressSanitizer
```

10 auto-discovered test files cover: core ECS, queries, systems, observers, singletons, high-level API, meta, JSON, scripts, and edge cases. See `tests/tester.nim` for the runner, `tests/config.nims` for ASan support.

## Project Structure

```
flecs/
├── flecs.nim                 # Futhark driver
├── flecs_nim.nimble          # Package config (srcDir = "src")
├── doc.md                    # Chinese usage guide
├── flecs/                    # FLECS C source (git submodule)
├── wrappers/                 # C wrapper headers for modular generation
├── scripts/
│   └── regenerate.sh         # one-command regeneration
├── src/
│   ├── flecs.nim             # entry point (compile + link + export)
│   └── flecs/
│       ├── raw.nim           # [generated] core FFI
│       ├── core.nim          # core type-safe wrappers
│       ├── high.nim          # Nim-style high-level API
│       ├── meta.nim          # reflection addon
│       ├── json.nim          # JSON serialization
│       ├── http.nim          # HTTP server addon
│       ├── script.nim        # Flecs script addon
│       ├── alerts.nim        # alerts addon
│       ├── stats.nim         # stats addon
│       ├── app.nim           # app framework addon
│       └── all.nim           # convenience import-all
├── examples/
│   ├── hello_world.nim       # minimal example
│   ├── highlevel.nim         # high-level API example
│   ├── entities/ / queries/ / systems/
│   └── observers/ / relationships/ / reflection/
├── tests/
│   ├── config.nims           # ASan support
│   ├── shared.nim            # shared test helpers
│   ├── tester.nim            # auto-discovering runner
│   ├── tcore.nim / tquery.nim / tsystem.nim
│   ├── tobserver.nim / tsingleton.nim / thigh.nim
│   ├── tmeta.nim / tjson.nim / tscript.nim
│   └── tedge.nim
├── README.md / README_zh.md
└── .github/workflows/
    └── ci.yml                # Nim 2.2.8 + stable, 3 build modes, 3 platforms
```

## License

MIT
