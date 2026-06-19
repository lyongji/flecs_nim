import flecs_nim

# 最简示例：世界创建、组件注册、实体操作
type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_component(world, Velocity)

  # 创建命名实体 Bob
  let bob = ecs_entity(world, "Bob")
  ecs_set(world, bob, Position, Position(x: 0, y: 0))
  ecs_set(world, bob, Velocity, Velocity(vx: 1, vy: 2))

  # 遍历所有有 Position 的实体
  var it = ecs_each_id(world, ecs_id(Position))
  while ecs_each_next(addr it):
    let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      let e = entities[i]
      if ecs_has_id(world, e, ecs_id(Velocity)):
        let p = ecs_get_mut(world, e, Position)
        let v = ecs_get(world, e, Velocity)
        p.x += v.vx
        p.y += v.vy

  echo "Bob: (", ecs_get(world, bob, Position).x, ", ",
    ecs_get(world, bob, Position).y, ")"
  # 输出: Bob: (1.0, 2.0)

main()
