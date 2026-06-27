## JSON addon — JSON 序列化/反序列化
##
## 在组件值和 JSON 字符串之间进行转换。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
import raw
import core

# ──────────────────────────────────────────────────────────────────────
# 实体 → JSON
# ──────────────────────────────────────────────────────────────────────

proc entityToJson*(world: ptr ecs_world_t; entity: ecs_entity_t): string =
  ## 将实体序列化为 JSON 字符串。
  var desc: ecs_entity_to_json_desc_t
  desc.serialize_entity_id = true
  desc.serialize_doc = true
  result = $ecs_entity_to_json(world, entity, addr desc)

proc entityToJson*(world: ptr ecs_world_t; entity: ecs_entity_t;
                   desc: ecs_entity_to_json_desc_t): string =
  ## 使用指定的描述符将实体序列化为 JSON。
  result = $ecs_entity_to_json(world, entity, addr desc)

proc iterToJson*(it: ptr ecs_iter_t): string =
  ## 将迭代器结果序列化为 JSON。
  var desc: ecs_iter_to_json_desc_t
  desc.serialize_entity_ids = true
  result = $ecs_iter_to_json(it, addr desc)

proc iterToJson*(it: ptr ecs_iter_t;
                 desc: ecs_iter_to_json_desc_t): string =
  result = $ecs_iter_to_json(it, addr desc)

proc worldToJson*(world: ptr ecs_world_t): string =
  ## 将整个世界状态序列化为 JSON。
  result = $ecs_world_to_json(world, nil)

proc worldToJson*(world: ptr ecs_world_t;
                  desc: ecs_world_to_json_desc_t): string =
  result = $ecs_world_to_json(world, addr desc)

# ──────────────────────────────────────────────────────────────────────
# JSON → 实体
# ──────────────────────────────────────────────────────────────────────

proc entityFromJson*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     json: string): bool =
  ## 从 JSON 字符串更新实体的组件值。
  result = ecs_entity_from_json(world, entity, cstring(json), nil) != nil

proc entityFromJson*(world: ptr ecs_world_t; entity: ecs_entity_t;
                     json: string; desc: ecs_from_json_desc_t): bool =
  result = ecs_entity_from_json(world, entity, cstring(json), addr desc) != nil

proc worldFromJson*(world: ptr ecs_world_t; json: string): bool =
  ## 从 JSON 字符串加载世界状态。
  result = ecs_world_from_json(world, cstring(json), nil) != nil

proc worldFromJson*(world: ptr ecs_world_t; json: string;
                    desc: ecs_from_json_desc_t): bool =
  result = ecs_world_from_json(world, cstring(json), addr desc) != nil

# ──────────────────────────────────────────────────────────────────────
# 组件值 ↔ JSON（需注册 struct 描述）
# ──────────────────────────────────────────────────────────────────────

proc valueToJson*(world: ptr ecs_world_t; T: typedesc;
                  data: pointer): string =
  ## 将类型 T 的组件值序列化为 JSON。
  result = $ecs_ptr_to_json(world, ecs_id(T), data, nil)

proc valueFromJson*(world: ptr ecs_world_t; T: typedesc;
                    data: pointer; json: string): bool =
  ## 从 JSON 字符串反序列化到 T 类型的值。
  result = ecs_ptr_from_json(world, ecs_id(T), data, cstring(json), nil) != nil
