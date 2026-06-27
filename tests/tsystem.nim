import std/assertions
import flecs
include shared

var gSystemCalled = 0

proc systemCallback(it: ptr ecs_iter_t) {.cdecl.} =
  gSystemCalled += 1

# =============================================================================
# ecs_system
# =============================================================================

block system_run:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  let e = ecs_new(world)
  ecs_add(world, e, Position)

  gSystemCalled = 0

  let sysId = ecs_system(world, ecs_system_desc_t(
    callback: systemCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
    ),
  ))
  doAssert sysId != 0

  discard ecs_run(world, sysId, 0.0, nil)
  doAssert gSystemCalled >= 1, "system callback should be called"

block system_multiple_entities:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  for i in 0 ..< 5:
    let e = ecs_new(world)
    ecs_add(world, e, Position)

  gSystemCalled = 0

  let sysId = ecs_system(world, ecs_system_desc_t(
    callback: systemCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
    ),
  ))

  discard ecs_run(world, sysId, 0.0, nil)
  doAssert gSystemCalled >= 1, "system should process all matching entities"

echo "=== tsystem.nim: 全部通过 ==="
