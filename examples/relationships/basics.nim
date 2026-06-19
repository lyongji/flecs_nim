import flecs_nim

# relationships/basics — 关系（Pairs）：Eats、Grows、通配符查询
type
  Eats = object
  Grows = object

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_tag(world, Eats)

  # 创建关系目标实体
  let grows = ecs_entity(world, "Grows")
  let apples = ecs_entity(world, "Apples")
  let pears = ecs_entity(world, "Pears")

  # Bob 拥有 3 个关系
  let bob = ecs_entity(world, "Bob")
  ecs_add_id(world, bob, ecs_make_pair(ecs_id(Eats), apples))
  ecs_add_id(world, bob, ecs_make_pair(ecs_id(Eats), pears))
  ecs_add_id(world, bob, ecs_make_pair(grows, pears))

  # Has 可用于关系检查
  echo "Bob eats Apples? ",
    ecs_has_id(world, bob, ecs_make_pair(ecs_id(Eats), apples))
  echo "Bob eats Pears? ",
    ecs_has_id(world, bob, ecs_make_pair(ecs_id(Eats), pears))

  # 通配符 (EcsWildcard) 匹配任意关系目标
  echo "Bob grows something? ",
    ecs_has_id(world, bob, ecs_make_pair(grows, EcsWildcard))

  # 打印 Bob 的组件类型
  echo "\nBob 的类型: ", ecs_type_str(world, ecs_get_type(world, bob))

main()
