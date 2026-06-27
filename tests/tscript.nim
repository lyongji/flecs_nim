import std/assertions
import flecs
include shared

# =============================================================================
# Script execution
# =============================================================================

block script_basic_tag:
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_new(world)
  discard ecs_component(world, Position)

  let scriptId = runScript(world, "MyTag")
  doAssert scriptId != 0, "script init should return non-zero entity"

block script_with_component:
  var world = ecs_init()
  defer: discard ecs_fini(world)
  discard ecs_component(world, Position)

  let scriptId = runScript(world,
    "MyEntity {\n" &
    "  Position: {x: 10, y: 20}\n" &
    "}\n")
  doAssert scriptId != 0

  # The script entity itself exists and is alive
  doAssert ecs_is_alive(world, scriptId)

echo "=== tscript.nim: 全部通过 ==="
