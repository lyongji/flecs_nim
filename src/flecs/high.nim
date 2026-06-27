## Nim-style high-level API for Flecs.
##
## Provides object-oriented wrappers with RAII lifecycle:
## - `EcsWorld` — world handle with `=destroy` (calls `ecs_fini`)
## - `EcsQuery` — query handle with `=destroy` (calls `ecs_query_fini`)
## - `EcsIter` — query iterator with typed field access
##
## Usage
## =====
##
## .. code-block:: nim
##   import flecs               # compile C source + get ecs_id macro
##   import flecs/high          # high-level API
##
##   type Position = object
##     x, y: float64
##
##   let world = newEcsWorld()
##   discard world.component(Position)
##   let e = world.entity("player")
##   world.set(e, Position, Position(x: 10, y: 20))
##
##   let q = world.queryTerms(
##     ecs_term_t(id: ecs_id(Position)),
##   )
##   for it in q.items:
##     for p in it.field(Position):
##       p.x += 1

import macros
import raw

# Re-export raw symbols so users of high.nim get the raw FFI too.
export raw

# ──────────────────────────────────────────────────────────────────────
# EcsWorld
# ──────────────────────────────────────────────────────────────────────

type
  EcsWorld* = object
    internal: ptr ecs_world_t

proc `=destroy`*(w: var EcsWorld) =
  if w.internal != nil:
    discard ecs_fini(w.internal)
    w.internal = nil

# Shallow copy is safe: =destroy checks for nil before freeing C resources.
# proc `=copy`*(dst: var EcsWorld; src: EcsWorld) {.error: "EcsWorld cannot be copied".}

proc newEcsWorld*(): EcsWorld =
  result = EcsWorld(internal: ecs_init())

proc worldPtr*(w: EcsWorld): ptr ecs_world_t {.inline.} =
  w.internal

# ──────────────────────────────────────────────────────────────────────
# Entity lifecycle
# ──────────────────────────────────────────────────────────────────────

proc entity*(w: EcsWorld; name: string): ecs_entity_t =
  var desc = ecs_entity_desc_t(name: cstring(name))
  result = ecs_entity_init(w.internal, addr desc)

proc entity*(w: EcsWorld): ecs_entity_t =
  result = ecs_new(w.internal)

proc delete*(w: EcsWorld; e: ecs_entity_t) =
  ecs_delete(w.internal, e)

proc isAlive*(w: EcsWorld; e: ecs_entity_t): bool =
  result = ecs_is_alive(w.internal, e)

proc lookup*(w: EcsWorld; path: string): ecs_entity_t =
  result = ecs_lookup(w.internal, cstring(path))

proc name*(w: EcsWorld; e: ecs_entity_t): string =
  result = $ecs_get_name(w.internal, e)

# ──────────────────────────────────────────────────────────────────────
# Component registration — macros, share globals with ecs_id from core.nim
# ──────────────────────────────────────────────────────────────────────

# ──────────────────────────────────────────────────────────────────────
# Component ID management (self-contained, no dependency on core.nim)
# ──────────────────────────────────────────────────────────────────────

macro compId*(T: typedesc): untyped =
  ## Get / cache the flecs component id for a Nim type.
  ## Uses a lazily-initialized global (own namespace HIGH_CID_ to avoid
  ## conflicting with `ecs_id` from core.nim).
  let typeName = T.repr
  let idName = ident("HIGH_CID_" & typeName & "_")
  result = quote do:
    when not declared(`idName`):
      var `idName` {.global.}: ecs_entity_t
    `idName`

macro component*(w: EcsWorld; T: typedesc): untyped =
  ## Register a Nim type as a component. Stores ID in `compId(T)`.
  let typeName = T.repr
  let idName = ident("HIGH_CID_" & typeName & "_")
  result = quote do:
    when not declared(`idName`):
      var `idName` {.global.}: ecs_entity_t
    if `idName` == 0:
      var edesc = ecs_entity_desc_t(
        name: cstring(`typeName`),
        symbol: cstring(`typeName`),
        use_low_id: true,
      )
      var compDesc = ecs_component_desc_t(
        entity: ecs_entity_init(`w`.internal, addr edesc),
        type_field: ecs_type_info_t(
          size: ecs_size_t(sizeof(`T`)),
          alignment: ecs_size_t(alignof(`T`)),
        ),
      )
      `idName` = ecs_component_init(`w`.internal, addr compDesc)

macro tag*(w: EcsWorld; T: typedesc): untyped =
  ## Register a tag (component without data). Stores ID in `compId(T)`.
  let typeName = T.repr
  let idName = ident("HIGH_CID_" & typeName & "_")
  result = quote do:
    when not declared(`idName`):
      var `idName` {.global.}: ecs_entity_t
    if `idName` == 0:
      var edesc = ecs_entity_desc_t(name: cstring(`typeName`))
      `idName` = ecs_entity_init(`w`.internal, addr edesc)

# ──────────────────────────────────────────────────────────────────────
# Component operations  —  all use compId(T) for consistency
# ──────────────────────────────────────────────────────────────────────

# Templates expand `compId(T)` at the caller's scope, ensuring the same
# global variable is used as the one created by `component(T)`.

template add*(w: EcsWorld; e: ecs_entity_t; T: typedesc) =
  ecs_add_id(w.internal, e, compId(T))

template remove*(w: EcsWorld; e: ecs_entity_t; T: typedesc) =
  ecs_remove_id(w.internal, e, compId(T))

template set*(w: EcsWorld; e: ecs_entity_t; T: typedesc; val: T) =
  ## Set a component value on an entity.
  var tmp = val
  ecs_set_id(w.internal, e, compId(T), csize_t(sizeof(T)),
             cast[pointer](addr tmp))

template get*(w: EcsWorld; e: ecs_entity_t; T: typedesc): ptr T =
  cast[ptr T](ecs_get_id(w.internal, e, compId(T)))

template getMut*(w: EcsWorld; e: ecs_entity_t; T: typedesc): ptr T =
  cast[ptr T](ecs_get_mut_id(w.internal, e, compId(T)))

template has*(w: EcsWorld; e: ecs_entity_t; T: typedesc): bool =
  ecs_has_id(w.internal, e, compId(T))

template owns*(w: EcsWorld; e: ecs_entity_t; T: typedesc): bool =
  ecs_owns_id(w.internal, e, compId(T))

template modified*(w: EcsWorld; e: ecs_entity_t; T: typedesc) =
  ecs_modified_id(w.internal, e, compId(T))

template ensure*(w: EcsWorld; e: ecs_entity_t; T: typedesc): ptr T =
  cast[ptr T](ecs_ensure_id(w.internal, e, compId(T), csize_t(sizeof(`T`))))

template emplace*(w: EcsWorld; e: ecs_entity_t; T: typedesc): ptr T =
  var isNew: bool
  cast[ptr T](ecs_emplace_id(w.internal, e, compId(T), csize_t(sizeof(`T`)),
             addr isNew))

# ──────────────────────────────────────────────────────────────────────
# Singleton operations
# ──────────────────────────────────────────────────────────────────────

template singletonAdd*(w: EcsWorld; T: typedesc) =
  ecs_add_id(w.internal, compId(T), compId(T))

template singletonRemove*(w: EcsWorld; T: typedesc) =
  ecs_remove_id(w.internal, compId(T), compId(T))

template singletonSet*(w: EcsWorld; T: typedesc; val: T) =
  var tmp = val
  ecs_set_id(w.internal, compId(T), compId(T), csize_t(sizeof(T)),
             cast[pointer](addr tmp))

template singletonGet*(w: EcsWorld; T: typedesc): ptr T =
  cast[ptr T](ecs_get_id(w.internal, compId(T), compId(T)))

template singletonGetMut*(w: EcsWorld; T: typedesc): ptr T =
  cast[ptr T](ecs_get_mut_id(w.internal, compId(T), compId(T)))

template singletonModified*(w: EcsWorld; T: typedesc) =
  ecs_modified_id(w.internal, compId(T), compId(T))

# ──────────────────────────────────────────────────────────────────────
# System, Observer, Pipeline
# ──────────────────────────────────────────────────────────────────────

proc system*(w: EcsWorld; desc: ecs_system_desc_t): ecs_entity_t =
  var d = desc
  result = ecs_system_init(w.internal, addr d)

proc observer*(w: EcsWorld; desc: ecs_observer_desc_t): ecs_entity_t =
  var d = desc
  result = ecs_observer_init(w.internal, addr d)

proc run*(w: EcsWorld; sys: ecs_entity_t; deltaTime: float64 = 0.0) =
  discard ecs_run(w.internal, sys, cfloat(deltaTime), nil)

proc progress*(w: EcsWorld; deltaTime: float64 = 0.0) =
  discard ecs_progress(w.internal, cfloat(deltaTime))

# ──────────────────────────────────────────────────────────────────────
# EcsQuery
# ──────────────────────────────────────────────────────────────────────

type
  EcsQuery* = object
    world: ptr ecs_world_t
    internal: ptr ecs_query_t

proc `=destroy`*(q: var EcsQuery) =
  if q.internal != nil:
    ecs_query_fini(q.internal)
    q.internal = nil

# Shallow copy is safe: =destroy checks for nil before freeing C resources.
# proc `=copy`*(dst: var EcsQuery; src: EcsQuery) {.error: "EcsQuery cannot be copied".}

proc query*(w: EcsWorld; desc: ecs_query_desc_t): EcsQuery =
  var d = desc
  result = EcsQuery(world: w.internal, internal: ecs_query_init(w.internal, addr d))

proc queryExpr*(w: EcsWorld; expr: string): EcsQuery =
  var d = ecs_query_desc_t(expr: cstring(expr))
  result = EcsQuery(world: w.internal,
                    internal: ecs_query_init(w.internal, addr d))

proc queryTerms*(w: EcsWorld; terms: varargs[ecs_term_t]): EcsQuery =
  var d: ecs_query_desc_t
  for i, t in terms:
    d.terms[i] = t
  result = EcsQuery(world: w.internal,
                    internal: ecs_query_init(w.internal, addr d))

# ──────────────────────────────────────────────────────────────────────
# EcsIter
# ──────────────────────────────────────────────────────────────────────

type
  EcsIter* = object
    internal: ecs_iter_t

proc count*(it: EcsIter): int32 =
  it.internal.count

proc entities*(it: EcsIter): ptr ecs_entity_t =
  it.internal.entities

proc field*(it: EcsIter; T: typedesc; idx: Natural = 0): ptr UncheckedArray[T] =
  ## Typed component access via iterator field index.
  ## 0-based. Returns nil when the pointer is not available.
  if it.internal.ptrs == nil:
    result = nil
  else:
    result = cast[ptr UncheckedArray[T]](
      cast[ptr UncheckedArray[pointer]](it.internal.ptrs)[idx])

proc next*(it: var EcsIter): bool =
  ecs_query_next(addr it.internal)

iterator items*(q: EcsQuery): EcsIter =
  var it: EcsIter
  it.internal = ecs_query_iter(q.world, q.internal)
  while ecs_query_next(addr it.internal):
    yield it

proc queryIter*(q: EcsQuery): EcsIter =
  result = EcsIter(internal: ecs_query_iter(q.world, q.internal))

# ──────────────────────────────────────────────────────────────────────
# ecs_each
# ──────────────────────────────────────────────────────────────────────

iterator eachId*(w: EcsWorld; componentId: ecs_id_t): EcsIter =
  var it = ecs_each_id(w.internal, componentId)
  while ecs_each_next(addr it):
    yield EcsIter(internal: it)
