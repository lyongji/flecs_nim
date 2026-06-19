# flecs_nim — Nim bindings for FLECS

[Nim][nim] bindings for [FLECS][flecs] v4.1.5, a fast and lightweight Entity Component System written in C.

[nim]: https://nim-lang.org
[flecs]: https://github.com/SanderMertens/flecs

## Quick Start

```nim
import flecs_nim

type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64

# Init world
var world = ecs_init()
defer: discard ecs_fini(world)

# Register components (like ECS_COMPONENT)
discard ecs_component(world, Position)
discard ecs_component(world, Velocity)

# Create entity with components
let e = ecs_new(world)
ecs_add(world, e, Position)
ecs_add(world, e, Velocity)
ecs_set(world, e, Position, Position(x: 10, y: 20))

# Query entities
let q = ecs_query(world, ecs_query_desc_t(
  terms: ecs_terms(
    ecs_term_t(id: ecs_id(Position)),
    ecs_term_t(id: ecs_id(Velocity)),
  ),
))

var it = ecs_query_iter(world, q)
while ecs_query_next(addr it):
  echo "matched: ", it.count
```

## API

### Type-safe wrappers (Nim templates — mirror C macros)

| Nim call | C equivalent |
|----------|-------------|
| `ecs_component(world, Position)` | `ECS_COMPONENT(world, Position)` |
| `ecs_tag(world, MyTag)` | `ECS_TAG(world, MyTag)` |
| `ecs_add(world, e, Position)` | `ecs_add(world, e, Position)` |
| `ecs_set(world, e, Pos, Pos(x:1))` | `ecs_set(world, e, Position, {1, 0})` |
| `ecs_get(world, e, Position)` | `ecs_get(world, e, Position)` |
| `ecs_has(world, e, Position)` | `ecs_has(world, e, Position)` |
| `ecs_remove(world, e, Position)` | `ecs_remove(world, e, Position)` |
| `ecs_query(world, desc)` | `ecs_query(world, {...})` |
| `ecs_system(world, desc)` | `ecs_system(world, {...})` |
| `ecs_observer(world, desc)` | `ecs_observer(world, {...})` |
| `ecs_terms(term1, term2)` | `{ecs_id(X), ecs_id(Y)}` |
| Singleton: `ecs_singleton_add/set/get/...` | `ecs_singleton_*` |

All raw `ecs_*` procs (714 total) from `<flecs.h>` are available directly.

### Callbacks

Callbacks must be `{.cdecl.}` procs at module scope (not closures):

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
```

## Building

### Requirements

- Nim ≥ 2.2.8
- C compiler (GCC, Clang, or MSVC)
- [futhark][futhark] (for regenerating bindings)

[futhark]: https://github.com/PMunch/futhark

### Compile

```sh
nimble install
nimble test
```

To regenerate the raw bindings from `flecs.h`:

```sh
nim c -r -d:useFuthark flecs.nim
```

### Linking

FLECS is compiled from vendored source (`flecs/distr/flecs.c`). System libraries are linked automatically per platform:

| Platform | Link flags |
|----------|-----------|
| Linux | `-lm -lpthread -ldl` |
| macOS | `-lm -lpthread -ldl` |
| Windows (MSVC) | `-lws2_32 -ldbghelp` |

## Project Structure

```
flecs_nim/
├── flecs.nim              # Futhark driver (regenerate raw bindings)
├── flecs_nim.nimble       # Nimble package (srcDir = "src")
├── flecs/                 # FLECS C source (git submodule)
├── src/
│   ├── flecs_nim.nim      # Public module (link flags + raw + ergonomic layer)
│   └── flecs_nim_raw.nim  # Futhark-generated raw FFI (714 procs, ~4100 lines)
├── tests/
│   ├── test1.nim          # Smoke tests (10 blocks, doAssert)
│   └── tester.nim         # Auto-discovering test runner
└── .github/workflows/
    └── ci.yml             # Cross-platform CI (Linux, macOS, Windows)
```

## License

MIT
