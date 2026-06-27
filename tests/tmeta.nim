import std/assertions
import flecs
import flecs/meta
include shared

# =============================================================================
# typeStr / componentIdStr
# =============================================================================

block type_str:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let cid = ecs_component(world, Position)
  let s = typeStr(world, cid)
  doAssert s.len > 0

block component_id_str:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let cid = ecs_component(world, Position)
  let s = componentIdStr(world, cid)
  doAssert s.len > 0

# =============================================================================
# MetaCursor basic (without struct description, using a single field)
# =============================================================================

block meta_cursor_primitive:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  let cid = ecs_component(world, Position)

  # Create a cursor over a Position value (no struct desc needed for basic access)
  var pos = Position(x: 3.14, y: 2.71)

  # Basic cursor creation
  var cursor = initMetaCursor(world, cid, addr pos)
  discard cursor

echo "=== tmeta.nim: 全部通过 ==="
