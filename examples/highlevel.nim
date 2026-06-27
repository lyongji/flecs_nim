import flecs
import flecs/high

# Nim 风格高层 API — 完整示例
type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64

proc main() =
  let world = newEcsWorld()

  # 注册组件 — compId(T) 自动缓存
  world.component(Position)
  world.component(Velocity)

  # 创建实体
  let bob = world.entity("Bob")
  let alice = world.entity("Alice")
  world.set(bob, Position, Position(x: 0, y: 0))
  world.set(bob, Velocity, Velocity(vx: 1, vy: 2))
  world.set(alice, Position, Position(x: 100, y: 200))

  # 读取 + 检测
  echo "Bob: (", world.get(bob, Position).x, ", ", world.get(bob, Position).y, ")"
  doAssert world.has(bob, Position)
  doAssert world.has(bob, Velocity)
  doAssert not world.has(alice, Velocity)

  # 修改
  world.getMut(bob, Velocity).vx = 10
  echo "Bob vx after getMut: ", world.get(bob, Velocity).vx

  # 查询 + 迭代
  let q = world.queryTerms(
    ecs_term_t(id: compId(Position)),
    ecs_term_t(id: compId(Velocity)),
  )
  echo "Query matched (Position + Velocity):"
  for it in q.items:
    var ents = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      let p = world.get(ents[i], Position)
      let v = world.get(ents[i], Velocity)
      echo "  (", p.x, ", ", p.y, ") v=(", v.vx, ", ", v.vy, ")"

  # eachId 遍历
  echo "All entities with Position:"
  for it in world.eachId(compId(Position)):
    var ents = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      let p = world.get(ents[i], Position)
      echo "  ", ents[i], " at (", p.x, ", ", p.y, ")"

  echo "Done!"

main()
