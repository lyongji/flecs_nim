import std/assertions
import flecs
include shared

# =============================================================================
# ecs_query
# =============================================================================

block query_multi_match:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_component(world, Velocity)

  for i in 0 ..< 3:
    let e = ecs_new(world)
    ecs_add(world, e, Position)
    ecs_add(world, e, Velocity)
    ecs_set(world, e, Position, Position(x: float64(i), y: float64(i)))

  let q = ecs_query(world, ecs_query_desc_t(
    terms: ecs_terms(
      ecs_term_t(id: ecs_id(Position)),
      ecs_term_t(id: ecs_id(Velocity)),
    ),
  ))
  doAssert q != nil

  var it = ecs_query_iter(world, q)
  var count = 0
  while ecs_query_next(addr it):
    count += it.count
  doAssert count == 3

block query_empty:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)

  let q = ecs_query(world, ecs_query_desc_t(
    terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
  ))

  var it = ecs_query_iter(world, q)
  var count = 0
  while ecs_query_next(addr it):
    count += it.count
  doAssert count == 0

block query_single:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  let e = ecs_new(world)
  ecs_add(world, e, Position)

  let q = ecs_query(world, ecs_query_desc_t(
    terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
  ))

  var it = ecs_query_iter(world, q)
  var count = 0
  while ecs_query_next(addr it):
    count += it.count
  doAssert count == 1

block query_entity_iteration:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  for i in 0 ..< 3:
    discard makePosEntity(world, float64(i), 0.0)

  let q = ecs_query(world, ecs_query_desc_t(
    terms: ecs_terms(ecs_term_t(id: ecs_id(Position))),
  ))

  var it = ecs_query_iter(world, q)
  var found: seq[ecs_entity_t]
  while ecs_query_next(addr it):
    let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      found.add entities[i]
  doAssert found.len == 3

# =============================================================================
# ecs_each
# =============================================================================

block each_basic:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  let e1 = makePosEntity(world, 1.0, 2.0)
  let e2 = makePosEntity(world, 3.0, 4.0)

  var count = 0
  var it = ecs_each_id(world, ecs_id(Position))
  while ecs_each_next(addr it):
    count += it.count
  doAssert count == 2

echo "=== tquery.nim: 全部通过 ==="
