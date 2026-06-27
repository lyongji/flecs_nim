import std/assertions
import flecs
include shared

# =============================================================================
# Singleton operations
# =============================================================================

block singleton_set_get:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Gravity)
  ecs_singleton_add(world, Gravity)
  ecs_singleton_set(world, Gravity, Gravity(value: 9.8))
  doAssert abs(ecs_singleton_get(world, Gravity).value - 9.8) < 0.001

block singleton_get_mut:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Gravity)
  ecs_singleton_add(world, Gravity)
  ecs_singleton_get_mut(world, Gravity).value = 42.0
  ecs_singleton_modified(world, Gravity)
  doAssert abs(ecs_singleton_get(world, Gravity).value - 42.0) < 0.001

block singleton_remove:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Gravity)
  ecs_singleton_add(world, Gravity)
  doAssert ecs_has_id(world, ecs_id(Gravity), ecs_id(Gravity))
  ecs_singleton_remove(world, Gravity)
  doAssert not ecs_has_id(world, ecs_id(Gravity), ecs_id(Gravity))

echo "=== tsingleton.nim: 全部通过 ==="
