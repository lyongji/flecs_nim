import std/assertions
import flecs
include shared

# =============================================================================
# Multi-world isolation
# =============================================================================

block multi_world:
  var w1 = ecs_init()
  var w2 = ecs_init()
  defer:
    discard ecs_fini(w1)
    discard ecs_fini(w2)

  discard ecs_component(w1, Position)
  discard ecs_component(w2, Position)

  let e1 = ecs_new(w1)
  ecs_add(w1, e1, Position)
  let e2 = ecs_new(w2)
  ecs_add(w2, e2, Position)

  # entity IDs might be the same (both first entity), but worlds are independent
  doAssert ecs_is_alive(w1, e1)
  doAssert ecs_is_alive(w2, e2)

# =============================================================================
# Empty world
# =============================================================================

block empty_world:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  doAssert not ecs_is_fini(world)

block no_entities:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  # no entities created — ecs_new should still work
  let e = ecs_new(world)
  doAssert e != 0

# =============================================================================
# Entity after delete
# =============================================================================

block dead_entity_check:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Position)

  let e = ecs_new(world)
  ecs_add(world, e, Position)
  ecs_delete(world, e)

  doAssert not ecs_is_alive(world, e)

# =============================================================================
# ecs_progress without systems
# =============================================================================

block progress_noop:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  # calling progress with no systems should be safe
  let ok = ecs_progress(world, 0.0)
  doAssert ok, "progress with no systems should succeed"

# NOTE: HTTP and App tests are excluded from CI (need network/display).
# Run manually if needed.

echo "=== tedge.nim: 全部通过 ==="
