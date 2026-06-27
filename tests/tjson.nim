import std/assertions
import std/strutils
import flecs
import flecs/json
include shared

# =============================================================================
# Entity → JSON  (basic, no struct description needed)
# =============================================================================

block entity_to_json_basic:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Position)

  let e = ecs_new(world)
  ecs_add(world, e, Position)

  let json = entityToJson(world, e)
  doAssert json.len > 0, "JSON should be non-empty"

# =============================================================================
# World → JSON
# =============================================================================

block world_to_json:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Position)
  discard makePosEntity(world, 1.0, 2.0)

  let json = worldToJson(world)
  doAssert json.len > 0, "world JSON should be non-empty"

echo "=== tjson.nim: 全部通过 ==="
