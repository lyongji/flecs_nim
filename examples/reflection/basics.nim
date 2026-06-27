import flecs

# reflection/basics — 组件反射：为 Position 添加元信息并序列化
type
  Position = object
    x, y: float32

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  # 1. 注册组件（与往常一样）
  discard ecs_component(world, Position)

  # 2. 为组件添加反射元信息
  var members: array[32, ecs_member_t]
  members[0] = ecs_member_t(name: cstring"x",
    type_field: ecs_entity_t(FLECS_IDecs_f32_tID_private))
  members[1] = ecs_member_t(name: cstring"y",
    type_field: ecs_entity_t(FLECS_IDecs_f32_tID_private))

  var structDesc = ecs_struct_desc_t(
    entity: ecs_id(Position),
    members: members,
  )
  discard ecs_struct_init(world, addr structDesc)

  # 3. 创建实体
  let e = ecs_entity(world, "Ent")
  ecs_set(world, e, Position, Position(x: 10, y: 20))

  # 4. 将组件值序列化为 flecs 表达式字符串
  let posPtr = ecs_get(world, e, Position)
  let expr = ecs_ptr_to_expr(world, ecs_id(Position), cast[pointer](posPtr))
  echo expr  # 输出: {x: 10, y: 20}

main()
