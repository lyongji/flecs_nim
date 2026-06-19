import flecs_nim

# observers/basics — 监听组件的 OnAdd / OnRemove 事件
type
  Health = object
    hp: float64
  Poisoned = object  # tag

var gTriggerCount = 0

proc onAddCallback(it: ptr ecs_iter_t) {.cdecl.} =
  gTriggerCount += it.count
  echo "  [+] Health 被添加"

proc onRemoveCallback(it: ptr ecs_iter_t) {.cdecl.} =
  echo "  [-] Health 被移除"

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Health)
  discard ecs_tag(world, Poisoned)

  # 注册 observer: 监听 Health 的添加
  discard ecs_observer(world, ecs_observer_desc_t(
    events: [EcsOnAdd, 0'u64, 0, 0, 0, 0, 0, 0],
    callback: onAddCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Health))),
    ),
  ))

  # 注册 observer: 监听 Health 的移除
  discard ecs_observer(world, ecs_observer_desc_t(
    events: [EcsOnRemove, 0'u64, 0, 0, 0, 0, 0, 0],
    callback: onRemoveCallback,
    query: ecs_query_desc_t(
      terms: ecs_terms(ecs_term_t(id: ecs_id(Health))),
    ),
  ))

  echo "创建实体 + 添加 Health..."
  let hero = ecs_new(world)
  ecs_add(world, hero, Health)
  discard ecs_progress(world, 0.0)

  echo "\n设置 Health 值 + 添加 Poisoned tag..."
  ecs_set(world, hero, Health, Health(hp: 100))
  ecs_add(world, hero, Poisoned)

  echo "\n移除 Health..."
  ecs_remove(world, hero, Health)
  discard ecs_progress(world, 0.0)

  echo "\nObserver 共触发 ", gTriggerCount, " 次"

main()
