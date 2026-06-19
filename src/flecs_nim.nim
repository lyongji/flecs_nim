# Flecs Nim 绑定 - 公开模块
# 编译 C 源文件（flecs 随仓库分发，静态编译链入）
{.compile: "../flecs/distr/flecs.c".}

# 平台链接库设置
when defined(windows):
  {.passL: "-lws2_32 -ldbghelp".}
elif defined(linux):
  {.passL: "-lm -lpthread -ldl".}
elif defined(macosx):
  {.passL: "-lm -lpthread -ldl".}

# 引入 futhark 生成的原始绑定
include "flecs_nim_raw"

import macros

# =============================================================================
# 组件 ID 声明
# =============================================================================

macro ecs_id*(T: typedesc): untyped =
  ## 获取组件类型对应的 flecs component id。
  ## 变量声明为 global，跨 block 持久。
  let typeName = T.repr
  let idName = ident("FLECS_ID" & typeName & "ID_")
  result = quote do:
    when not declared(`idName`):
      var `idName` {.global.}: ecs_entity_t
    `idName`

# =============================================================================
# 实体创建
# =============================================================================

template ecs_new_w*(world: ptr ecs_world_t; T: typedesc): ecs_entity_t =
  ## 创建带组件的新实体。对应 C 宏: ``ecs_new_w(world, Position)``
  ecs_new_w_id(world, ecs_id(T))

template ecs_entity*(world: ptr ecs_world_t; entityName: string): ecs_entity_t =
  ## 创建命名实体。对应 C 宏: ``ecs_entity(world, { .name = "Player" })``
  ##
  ## .. code-block:: nim
  ##   let player = ecs_entity(world, "Player")
  var desc = ecs_entity_desc_t(name: cstring(entityName))
  ecs_entity_init(world, addr desc)

# =============================================================================
# 组件添加/移除
# =============================================================================

template ecs_add*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc) =
  ## 为实体添加组件。对应 C 宏: `ecs_add(world, e, Position)`
  ecs_add_id(world, entity, ecs_id(T))

template ecs_remove*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc) =
  ## 从实体移除组件。对应 C 宏: `ecs_remove(world, e, Position)`
  ecs_remove_id(world, entity, ecs_id(T))

template ecs_auto_override*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc) =
  ## 自动覆盖组件。对应 C 宏: `ecs_auto_override(world, e, Position)`
  ecs_auto_override_id(world, entity, ecs_id(T))

# =============================================================================
# 组件读取/写入
# =============================================================================

template ecs_set*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc;
                  value: T) =
  ## 设置组件值。对应 C 宏: `ecs_set(world, e, Position, {10, 20})`
  var tmp = value  # ponytail: stable stack address for set_id
  ecs_set_id(world, entity, ecs_id(T), csize_t(sizeof(T)),
             cast[pointer](addr tmp))

template ecs_set_ptr*(world: ptr ecs_world_t; entity: ecs_entity_t;
                      T: typedesc; p: ptr T) =
  ## 通过指针设置组件。对应 C 宏: `ecs_set_ptr(world, e, Position, &pos)`
  ecs_set_id(world, entity, ecs_id(T), csize_t(sizeof(T)),
             cast[pointer](p))

template ecs_get*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc): ptr T =
  ## 获取组件指针。对应 C 宏: ``ecs_get(world, e, Position)``
  cast[ptr T](ecs_get_id(world, entity, ecs_id(T)))

template ecs_get_mut*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc): ptr T =
  ## 获取可变组件指针。对应 C 宏: ``ecs_get_mut(world, e, Position)``
  cast[ptr T](ecs_get_mut_id(world, entity, ecs_id(T)))

template ecs_ensure*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc): ptr T =
  ## 确保组件存在并返回指针。对应 C 宏: ``ecs_ensure(world, e, Position)``
  cast[ptr T](ecs_ensure_id(world, entity, ecs_id(T), csize_t(sizeof(T))))

template ecs_emplace*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc): ptr T =
  ## Emplace 组件，返回指针。
  var isNew: bool
  cast[ptr T](ecs_emplace_id(world, entity, ecs_id(T), csize_t(sizeof(T)), addr isNew))

# =============================================================================
# 组件检测
# =============================================================================

template ecs_has*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc): bool =
  ## 检测实体是否拥有组件。对应 C 宏: ``ecs_has(world, e, Position)``
  ecs_has_id(world, entity, ecs_id(T))

template ecs_owns*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc): bool =
  ## 检测实体自身是否拥有组件（不含继承）。
  ecs_owns_id(world, entity, ecs_id(T))

# =============================================================================
# 单例 (Singleton)
# =============================================================================

template ecs_singleton_add*(world: ptr ecs_world_t; T: typedesc) =
  ## 添加单例组件。
  ecs_add_id(world, ecs_id(T), ecs_id(T))

template ecs_singleton_remove*(world: ptr ecs_world_t; T: typedesc) =
  ## 移除单例组件。
  ecs_remove_id(world, ecs_id(T), ecs_id(T))

template ecs_singleton_set*(world: ptr ecs_world_t; T: typedesc; value: T) =
  ## 设置单例组件。
  var tmp = value
  ecs_set_id(world, ecs_id(T), ecs_id(T), csize_t(sizeof(T)),
             cast[pointer](addr tmp))

template ecs_singleton_get*(world: ptr ecs_world_t; T: typedesc): ptr T =
  cast[ptr T](ecs_get_id(world, ecs_id(T), ecs_id(T)))

template ecs_singleton_get_mut*(world: ptr ecs_world_t; T: typedesc): ptr T =
  cast[ptr T](ecs_get_mut_id(world, ecs_id(T), ecs_id(T)))

template ecs_singleton_modified*(world: ptr ecs_world_t; T: typedesc) =
  ecs_modified_id(world, ecs_id(T), ecs_id(T))

# =============================================================================
# ECS_COMPONENT / ECS_TAG
# =============================================================================

macro ecs_component*(world: ptr ecs_world_t; T: typedesc): untyped =
  ## 声明并注册一个组件。对应 C 宏: ``ECS_COMPONENT(world, Position)``
  ## 每次调用都会在当前 world 中注册（幂等）。
  let typeName = T.repr
  let idName = ident("FLECS_ID" & typeName & "ID_")
  result = quote do:
    when not declared(`idName`):
      var `idName` {.global.}: ecs_entity_t
    var edesc = ecs_entity_desc_t(
      name: cstring(`typeName`),
      symbol: cstring(`typeName`),
      use_low_id: true,
    )
    var compDesc = ecs_component_desc_t(
      entity: ecs_entity_init(`world`, addr edesc),
      type_field: ecs_type_info_t(
        size: ecs_size_t(sizeof(`T`)),
        alignment: ecs_size_t(alignof(`T`)),
      ),
    )
    `idName` = ecs_component_init(`world`, addr compDesc)
    `idName`

macro ecs_tag*(world: ptr ecs_world_t; T: typedesc): untyped =
  ## 声明一个 tag（无数据组件）。对应 C 宏: ``ECS_TAG(world, MyTag)``
  let typeName = T.repr
  let idName = ident("FLECS_ID" & typeName & "ID_")
  result = quote do:
    when not declared(`idName`):
      var `idName` {.global.}: ecs_entity_t
    var edesc = ecs_entity_desc_t(name: cstring(`typeName`))
    `idName` = ecs_entity_init(`world`, addr edesc)
    `idName`

# =============================================================================
# ecs_modified
# =============================================================================

template ecs_modified*(world: ptr ecs_world_t; entity: ecs_entity_t; T: typedesc) =
  ## 通知 flecs 组件已被修改。对应 C 宏: ``ecs_modified(world, e, Position)``
  ecs_modified_id(world, entity, ecs_id(T))

# =============================================================================
# ecs_query / ecs_system / ecs_observer 声明式 API
# =============================================================================

template ecs_terms*(args: varargs[ecs_term_t]): array[32, ecs_term_t] =
  ## 构建精确 32 项的 terms 数组（剩余项用默认值填充）。
  ## 对应 C 中 ``{ ecs_id(Pos), ecs_id(Vel) }`` 的简写。
  var r: array[32, ecs_term_t]
  for i, t in args:
    r[i] = t
  r

template ecs_query*(world: ptr ecs_world_t; desc: ecs_query_desc_t): ptr ecs_query_t =
  ## 创建查询。对应 C 宏: ``ecs_query(world, { ... })``
  var d {.gensym.} = desc
  ecs_query_init(world, addr d)

template ecs_observer*(world: ptr ecs_world_t; desc: ecs_observer_desc_t): ecs_entity_t =
  ## 创建 observer。对应 C 宏: ``ecs_observer(world, { ... })``
  var d {.gensym.} = desc
  ecs_observer_init(world, addr d)

template ecs_system*(world: ptr ecs_world_t; desc: ecs_system_desc_t): ecs_entity_t =
  ## 创建 system。对应 C 宏: ``ecs_system(world, { ... })``
  var d {.gensym.} = desc
  ecs_system_init(world, addr d)

# =============================================================================
# 查询迭代辅助
# =============================================================================

template ecs_iter_next*(it: var ecs_iter_t): bool =
  ## 推进迭代器。对应 ``ecs_query_next``。
  ecs_query_next(addr it)
