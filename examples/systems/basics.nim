import flecs

# systems/basics — 系统创建与手动执行 (ecs_run)
type
  Position = object
    x, y: float64
  Velocity = object
    vx, vy: float64

var gSystemCalled = 0

proc moveCallback(it: ptr ecs_iter_t) {.cdecl.} =
  gSystemCalled += 1
  # 注意: ecs_run 中 it.ptrs 可能为 nil
  # 生产代码应使用 ecs_progress + pipeline，或通过 ecs_get 单独读取
  if it.ptrs != nil:
    let p = cast[ptr UncheckedArray[Position]](
      cast[ptr UncheckedArray[pointer]](it.ptrs)[0])
    let v = cast[ptr UncheckedArray[Velocity]](
      cast[ptr UncheckedArray[pointer]](it.ptrs)[1])
    for i in 0 ..< it.count:
      p[i].x += v[i].vx
      p[i].y += v[i].vy

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_component(world, Velocity)

  # 创建实体
  let e = ecs_entity(world, "Bob")
  ecs_set(world, e, Position, Position(x: 0, y: 0))
  ecs_set(world, e, Velocity, Velocity(vx: 1, vy: 2))

  # 创建系统
  let sysId = ecs_system(world, ecs_system_desc_t(
    callback: moveCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(
        ecs_term_t(id: ecs_id(Position)),
        ecs_term_t(id: ecs_id(Velocity)),
      ),
    ),
  ))

  echo "系统 ID: ", sysId

  # 手动运行系统
  gSystemCalled = 0
  discard ecs_run(world, sysId, 0.0, nil)
  echo "系统被调用: ", gSystemCalled, " 次"

  # 通过 ecs_get 验证（适用于 ecs_run 不填充 ptrs 的场景）
  echo "Bob: (", ecs_get(world, e, Position).x, ", ",
    ecs_get(world, e, Position).y, ")"

main()
