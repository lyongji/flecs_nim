import flecs_nim

# entities/iterate_components — 遍历实体的组件 ID 列表
type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64
  Human = object  # tag
  Eats = object
  Apples = object

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_component(world, Velocity)
  discard ecs_tag(world, Human)
  discard ecs_tag(world, Eats)
  discard ecs_tag(world, Apples)

  # 创建实体 Bob，挂载组件和关系
  let bob = ecs_entity(world, "Bob")
  ecs_set(world, bob, Position, Position(x: 10, y: 20))
  ecs_set(world, bob, Velocity, Velocity(vx: 1, vy: 1))
  ecs_add(world, bob, Human)
  ecs_add_id(world, bob, ecs_make_pair(ecs_id(Eats), ecs_id(Apples)))

  # 1. 用 ecs_type_str 打印全部组件
  echo "ecs_type_str: ", ecs_type_str(world, ecs_get_type(world, bob))

  # 2. 逐个迭代 type array
  let typ = ecs_get_type(world, bob)
  let ids = cast[ptr UncheckedArray[ecs_id_t]](typ.array)
  echo "\n组件 ID 列表 (", typ.count, " 个):"
  for j in 0 ..< typ.count:
    let idStr = ecs_id_str(world, ids[j])
    echo "  ", j, ": ", idStr

  # 3. 也查看组件实体自身的类型
  echo "\nPosition 组件自身的类型:"
  echo ecs_type_str(world, ecs_get_type(world, ecs_id(Position)))

main()
