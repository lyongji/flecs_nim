import flecs

# entities/hierarchy — 父子层级、路径查找、ChildOf 关系
type
  Position = object
    x, y: float64
  Star = object
  Planet = object
  Moon = object

proc main() =
  var world = ecs_init()
  defer: discard ecs_fini(world)

  discard ecs_component(world, Position)
  discard ecs_tag(world, Star)
  discard ecs_tag(world, Planet)
  discard ecs_tag(world, Moon)

  # 建立层级: Sun → (Mercury, Venus, Earth → Moon)
  let sun = ecs_entity(world, "Sun")
  ecs_add(world, sun, Star)
  ecs_set(world, sun, Position, Position(x: 1, y: 1))

  var descM = ecs_entity_desc_t(parent: sun, name: cstring"Mercury")
  let mercury = ecs_entity_init(world, addr descM)
  ecs_add(world, mercury, Planet)
  ecs_set(world, mercury, Position, Position(x: 1, y: 1))

  var descV = ecs_entity_desc_t(parent: sun, name: cstring"Venus")
  let venus = ecs_entity_init(world, addr descV)
  ecs_add(world, venus, Planet)
  ecs_set(world, venus, Position, Position(x: 2, y: 2))

  var descE = ecs_entity_desc_t(parent: sun, name: cstring"Earth")
  let earth = ecs_entity_init(world, addr descE)
  ecs_add(world, earth, Planet)
  ecs_set(world, earth, Position, Position(x: 3, y: 3))

  var descMoon = ecs_entity_desc_t(parent: earth, name: cstring"Moon")
  let moon = ecs_entity_init(world, addr descMoon)
  ecs_add(world, moon, Moon)
  ecs_set(world, moon, Position, Position(x: 0.1, y: 0.1))

  # 检查 Moon 是否是 Earth 的子实体
  echo "Moon 是 Earth 的子实体? ",
    ecs_has_id(world, moon, ecs_make_pair(EcsChildOf, earth))

  # 按路径查找
  let found = ecs_lookup(world, "Sun.Earth.Moon")
  let path = ecs_get_path_w_sep(world, 0, found, ".", nil)
  echo "查找路径: ", path

  # 遍历 Sun 的所有子实体
  echo "\nSun 的子实体:"
  var it = ecs_each_id(world, ecs_id(Position))
  while ecs_each_next(addr it):
    let entities = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)
    for i in 0 ..< it.count:
      let e = entities[i]
      if ecs_has_id(world, e, ecs_make_pair(EcsChildOf, sun)):
        let p = ecs_get(world, e, Position)
        echo "  ", ecs_get_name(world, e), " → (", p.x + 1.0, ", ", p.y + 1.0, ")"

main()
