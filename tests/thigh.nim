import std/assertions
import flecs
import flecs/high
include shared

# =============================================================================
# EcsWorld RAII
# =============================================================================

block world_create:
  let world = newEcsWorld()
  doAssert world.worldPtr != nil

block world_component:
  let world = newEcsWorld()
  world.component(Position)
  doAssert compId(Position) != 0

block world_entity:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity("test")
  doAssert e != 0
  doAssert world.name(e) == "test"

block world_anon_entity:
  let world = newEcsWorld()
  let e = world.entity()
  doAssert e != 0

block world_delete:
  let world = newEcsWorld()
  let e = world.entity()
  doAssert world.isAlive(e)
  world.delete(e)
  doAssert not world.isAlive(e)

block world_lookup:
  let world = newEcsWorld()
  let e = world.entity("Bob")
  doAssert world.lookup("Bob") == e

# =============================================================================
# Component operations (method-style)
# =============================================================================

block set_get:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity()
  world.set(e, Position, Position(x: 10, y: 20))
  let p = world.get(e, Position)
  doAssert abs(p.x - 10) < 0.001
  doAssert abs(p.y - 20) < 0.001

block get_mut:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity()
  world.add(e, Position)
  world.getMut(e, Position).x = 42.0
  doAssert abs(world.get(e, Position).x - 42.0) < 0.001

block has_component:
  let world = newEcsWorld()
  world.component(Position)
  world.component(Velocity)
  let e = world.entity()
  world.add(e, Position)
  doAssert world.has(e, Position)
  doAssert not world.has(e, Velocity)

block add_remove:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity()
  world.add(e, Position)
  doAssert world.has(e, Position)
  world.remove(e, Position)
  doAssert not world.has(e, Position)

# =============================================================================
# Singleton (method-style)
# =============================================================================

block singleton_set_get:
  let world = newEcsWorld()
  world.component(Gravity)
  world.singletonAdd(Gravity)
  world.singletonSet(Gravity, Gravity(value: 9.8))
  doAssert abs(world.singletonGet(Gravity).value - 9.8) < 0.001

# =============================================================================
# EcsQuery
# =============================================================================

block query_create:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity()
  world.set(e, Position, Position(x: 5, y: 10))

  let q = world.queryTerms(ecs_term_t(id: compId(Position)))
  var count = 0
  for it in q.items:
    count += it.count
  doAssert count == 1

block query_items_iterator:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity()
  world.set(e, Position, Position(x: 5, y: 10))

  let q = world.queryTerms(ecs_term_t(id: compId(Position)))
  var count = 0
  for it in q.items:
    count += it.count
  doAssert count == 1

block query_expr:
  let world = newEcsWorld()
  world.component(Position)
  let e = world.entity()
  world.add(e, Position)

  let q = world.queryExpr("Position")
  var count = 0
  for it in q.items:
    count += it.count
  doAssert count >= 1

# =============================================================================
# eachId
# =============================================================================

block each_id_basic:
  let world = newEcsWorld()
  world.component(Position)
  let e1 = world.entity()
  world.add(e1, Position)
  let e2 = world.entity()
  world.add(e2, Position)

  var count = 0
  for it in world.eachId(compId(Position)):
    count += it.count
  doAssert count == 2

echo "=== thigh.nim: 全部通过 ==="
