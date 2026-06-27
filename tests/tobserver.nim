import std/assertions
import flecs
include shared

var gObserverTriggered = 0

proc observerCallback(it: ptr ecs_iter_t) {.cdecl.} =
  gObserverTriggered += it.count

# =============================================================================
# ecs_observer
# =============================================================================

block observer_on_add:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Health)
  gObserverTriggered = 0

  discard ecs_observer(world, ecs_observer_desc_t(
    events: [EcsOnAdd, 0'u64, 0, 0, 0, 0, 0, 0],
    callback: observerCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Health))),
    ),
  ))

  let e = ecs_new(world)
  ecs_add(world, e, Health)
  discard ecs_progress(world, 0.0)
  doAssert gObserverTriggered == 1

block observer_on_add_multiple:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Health)
  gObserverTriggered = 0

  discard ecs_observer(world, ecs_observer_desc_t(
    events: [EcsOnAdd, 0'u64, 0, 0, 0, 0, 0, 0],
    callback: observerCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Health))),
    ),
  ))

  for i in 0 ..< 3:
    let e = ecs_new(world)
    ecs_add(world, e, Health)
  discard ecs_progress(world, 0.0)
  doAssert gObserverTriggered == 3, "observer should fire once per entity"

block observer_on_remove:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Health)
  gObserverTriggered = 0

  discard ecs_observer(world, ecs_observer_desc_t(
    events: [EcsOnRemove, 0'u64, 0, 0, 0, 0, 0, 0],
    callback: observerCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Health))),
    ),
  ))

  let e = ecs_new(world)
  ecs_add(world, e, Health)
  ecs_remove(world, e, Health)
  discard ecs_progress(world, 0.0)
  doAssert gObserverTriggered == 1

echo "=== tobserver.nim: 全部通过 ==="
