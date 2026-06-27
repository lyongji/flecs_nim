## Script addon — Flecs 脚本
##
## Flecs 实体标记语言（ECS 声明的脚本化描述）。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
import raw

proc runScript*(world: ptr ecs_world_t; code: string): ecs_entity_t =
  ## 运行 Flecs 脚本字符串，创建其中的实体。
  var desc = ecs_script_desc_t(code: cstring(code))
  result = ecs_script_init(world, addr desc)

proc runScriptFromFile*(world: ptr ecs_world_t; filename: string): ecs_entity_t =
  ## 从文件加载并运行 Flecs 脚本。
  var desc = ecs_script_desc_t(filename: cstring(filename))
  result = ecs_script_init(world, addr desc)
