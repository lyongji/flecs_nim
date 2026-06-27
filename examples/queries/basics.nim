import flecs

# queries/basics — 用 ecs_each 遍历 + 条件过滤
type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64
  Health = object
    hp: float64

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_component(world, Velocity)
  discard ecs_component(world, Health)

  # 创建实体
  for i in 0 ..< 5:
    let e = ecs_new(world)
    ecs_set(world, e, Position, Position(x: float64(i), y: float64(i * 2)))
    if i mod 2 == 0:
      ecs_set(world, e, Velocity, Velocity(vx: 1, vy: 0))
    ecs_set(world, e, Health, Health(hp: 100))

  # 匹配 Position + Velocity
  echo "=== 有 Position + Velocity ==="
  var count = 0
  var it = ecs_each_id(world, ecs_id(Position))
  while ecs_each_next(addr it):
    let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      let e = entities[i]
      if ecs_has_id(world, e, ecs_id(Velocity)):
        let pos = ecs_get(world, e, Position)
        let vel = ecs_get(world, e, Velocity)
        echo "  (", pos.x, ", ", pos.y, ") v=", vel.vx
        count += 1
  echo "  共 ", count, " 个"

  # 统计有 Health 的实体
  echo "\n=== 有 Health ==="
  var it2 = ecs_each_id(world, ecs_id(Health))
  count = 0
  while ecs_each_next(addr it2):
    count += it2.count
  echo "  共 ", count, " 个"

  # 有 Position 但可选 Velocity（全匹配）
  echo "\n=== Position + 可选 Velocity ==="
  var it3 = ecs_each_id(world, ecs_id(Position))
  count = 0
  while ecs_each_next(addr it3):
    count += it3.count
  echo "  共 ", count, " 个（所有有 Position 的实体）"

main()
