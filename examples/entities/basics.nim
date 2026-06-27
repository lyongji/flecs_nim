import flecs

# entities/basics — 实体 CRUD、tag、组件类型查看
type
  Position = object
    x, y: float64
  Walking = object  # tag（无数据组件）

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_tag(world, Walking)

  # 创建命名实体 Bob
  let bob = ecs_entity(world, "Bob")
  ecs_set(world, bob, Position, Position(x: 10, y: 20))
  ecs_add(world, bob, Walking)

  echo "Bob: (", ecs_get(world, bob, Position).x, ", ",
    ecs_get(world, bob, Position).y, ")"

  # 覆盖组件值
  ecs_set(world, bob, Position, Position(x: 30, y: 40))

  # 创建另一个实体 Alice
  let alice = ecs_entity(world, "Alice")
  ecs_set(world, alice, Position, Position(x: 100, y: 200))
  ecs_add(world, alice, Walking)

  # 查看 Alice 的组件列表
  echo "Alice: ", ecs_type_str(world, ecs_get_type(world, alice))

  # 移除 tag
  ecs_remove(world, alice, Walking)
  echo "移除 Walking 后: ", ecs_type_str(world, ecs_get_type(world, alice))

  # 遍历所有拥有 Position 的实体
  echo "\n拥有 Position 的实体:"
  var it = ecs_each_id(world, ecs_id(Position))
  while ecs_each_next(addr it):
    let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      let e = entities[i]
      let pos = ecs_get(world, e, Position)
      echo "  ", ecs_get_name(world, e), ": (", pos.x, ", ", pos.y, ")"

  # 删除实体
  ecs_delete(world, bob)
  echo "\nBob 存活? ", ecs_is_alive(world, bob)

main()
