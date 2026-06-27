import std/assertions
import flecs
include shared

# =============================================================================
# World lifecycle
# =============================================================================

block world_test:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  doAssert ecs_is_fini(world) == false

# =============================================================================
# Entity CRUD
# =============================================================================

block entity_create:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let e = ecs_new(world)
  doAssert ecs_is_alive(world, e)

block entity_delete:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let e = ecs_new(world)
  ecs_delete(world, e)
  doAssert not ecs_is_alive(world, e)

block entity_named:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let e = ecs_entity(world, "Player")
  doAssert $ecs_get_name(world, e) == "Player"
  doAssert ecs_lookup(world, "Player") == e

block entity_empty_name:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let e = ecs_entity(world, "")
  doAssert e != 0

# =============================================================================
# Component registration
# =============================================================================

block component_register:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let cid = ecs_component(world, Position)
  doAssert cid != 0, "component id should be non-zero"

block component_twice:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let c1 = ecs_component(world, Position)
  let c2 = ecs_component(world, Position)
  doAssert c1 == c2, "re-register same type should return same id"

# =============================================================================
# Component operations (add / set / get / has / remove)
# =============================================================================

block set_get:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Velocity)
  let e = ecs_new(world)
  ecs_add(world, e, Velocity)
  doAssert ecs_has(world, e, Velocity)
  ecs_set(world, e, Velocity, Velocity(vx: 1, vy: 2))
  let p = ecs_get(world, e, Velocity)
  doAssert abs(p.vx - 1) < 0.001
  ecs_remove(world, e, Velocity)
  doAssert not ecs_has(world, e, Velocity)

block get_mut:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Health)
  let e = ecs_new(world)
  ecs_add(world, e, Health)
  ecs_get_mut(world, e, Health).hp = 100
  ecs_modified(world, e, Health)
  doAssert abs(ecs_get(world, e, Health).hp - 100) < 0.001

block add_then_set:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Position)
  let e = ecs_new(world)
  ecs_add(world, e, Position)
  ecs_set(world, e, Position, Position(x: 5, y: 10))
  let p = ecs_get(world, e, Position)
  doAssert abs(p.x - 5) < 0.001
  doAssert abs(p.y - 10) < 0.001

echo "=== tcore.nim: 全部通过 ==="
