## Meta addon — 反射/元数据支持
##
## 组件类型反射的 Nim 风格包装：struct/enum/primitive 描述、元数据游标遍历。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
##
## 使用示例：
##   let world = newEcsWorld()
##   world.component(Position)
##   let tid = world.describeStruct(Position)   # 注册 struct 描述
##   echo world.componentExpr(Position)          # 序列化 {x:10, y:20}
import raw
import core

# ──────────────────────────────────────────────────────────────────────
# 类型描述：为组件注册 struct 元信息
# ──────────────────────────────────────────────────────────────────────

proc describeStruct*[T](world: ptr ecs_world_t;
                        members: openArray[ecs_member_t]): ecs_entity_t =
  ## 为 Nim 类型 T 注册 struct 反射描述。
  ## `members` 为字段描述数组。
  var d: ecs_struct_desc_t
  d.entity = ecs_id(T)
  for i, m in members:
    d.members[i] = m
  result = ecs_struct_init(world, addr d)

proc describeEnum*[T](world: ptr ecs_world_t;
                      constants: openArray[ecs_enum_constant_t]): ecs_entity_t =
  ## 为 Nim 类型 T 注册 enum 反射描述。
  var d: ecs_enum_desc_t
  d.entity = ecs_id(T)
  for i, c in constants:
    d.constants[i] = c
  result = ecs_enum_init(world, addr d)

proc describeBitmask*[T](world: ptr ecs_world_t;
                         constants: openArray[ecs_bitmask_constant_t]): ecs_entity_t =
  ## 为 Nim 类型 T 注册 bitmask 反射描述。
  var d: ecs_bitmask_desc_t
  d.entity = ecs_id(T)
  for i, c in constants:
    d.constants[i] = c
  result = ecs_bitmask_init(world, addr d)

proc describePrimitive*[T](world: ptr ecs_world_t;
                           kind: ecs_primitive_kind_t): ecs_entity_t =
  ## 为 Nim 类型 T 注册 primitive 反射描述。
  var d: ecs_primitive_desc_t
  d.entity = ecs_id(T)
  d.kind = kind
  result = ecs_primitive_init(world, addr d)

proc describeArray*[T](world: ptr ecs_world_t;
                       elemType: ecs_entity_t;
                       elemCount: int32): ecs_entity_t =
  ## 为 Nim 类型 T 注册 array 反射描述。
  var d: ecs_array_desc_t
  d.entity = ecs_id(T)
  d.type_field = elemType
  d.count = elemCount
  result = ecs_array_init(world, addr d)

# ──────────────────────────────────────────────────────────────────────
# 序列化：组件值 ↔ 字符串表达式
# ──────────────────────────────────────────────────────────────────────

proc componentExpr*(world: ptr ecs_world_t; componentId: ecs_entity_t;
                    data: pointer): string =
  ## 将组件值序列化为 Flecs 表达式字符串。
  ## 需先调用 `describeStruct` 注册 struct 描述。
  result = $ecs_ptr_to_expr(world, componentId, data)

proc typeStr*(world: ptr ecs_world_t; componentId: ecs_entity_t): string =
  ## 获取组件类型的可读名称。
  result = $ecs_type_str(world, ecs_get_type(world, componentId))

proc componentIdStr*(world: ptr ecs_world_t; componentId: ecs_entity_t): string =
  ## 获取组件 ID 的可读字符串。
  result = $ecs_id_str(world, componentId)

# ──────────────────────────────────────────────────────────────────────
# 元数据游标（高级：遍历结构体字段）
# ──────────────────────────────────────────────────────────────────────

type
  MetaCursor* = object
    ## 包装 `ecs_meta_cursor_t`，用于遍历组件值的字段。
    internal: ecs_meta_cursor_t

proc initMetaCursor*(world: ptr ecs_world_t; componentId: ecs_entity_t;
                     data: pointer): MetaCursor =
  ## 为组件类型 `componentId` 的值创建元数据游标。
  result.internal = ecs_meta_cursor(world, componentId, data)

proc next*(cursor: var MetaCursor): bool =
  ## 推进到下一个字段/元素。返回 `false` 表示遍历结束。
  result = ecs_meta_next(addr cursor.internal) != 0

proc elem*(cursor: var MetaCursor; idx: int32): bool =
  ## 跳转到数组/向量的第 `idx` 个元素。
  result = ecs_meta_elem(addr cursor.internal, idx) != 0

proc member*(cursor: var MetaCursor; name: string): bool =
  ## 跳转到名为 `name` 的字段。
  result = ecs_meta_member(addr cursor.internal, cstring(name)) != 0

proc tryMember*(cursor: var MetaCursor; name: string): bool =
  ## 尝试跳转到名为 `name` 的字段（不存在时不报错）。
  result = ecs_meta_try_member(addr cursor.internal, cstring(name)) != 0

proc push*(cursor: var MetaCursor): bool =
  ## 进入当前字段（如果是复合类型）。
  result = ecs_meta_push(addr cursor.internal) != 0

proc pop*(cursor: var MetaCursor): bool =
  ## 退出当前复合类型。
  result = ecs_meta_pop(addr cursor.internal) != 0

proc isCollection*(cursor: MetaCursor): bool =
  ## 当前字段是否为集合（数组/向量）。
  result = ecs_meta_is_collection(addr cursor.internal)

proc getType*(cursor: MetaCursor): ecs_entity_t =
  ## 获取当前字段的类型实体 ID。
  result = ecs_meta_get_type(addr cursor.internal)

proc getMember*(cursor: MetaCursor): string =
  ## 获取当前字段的名称。
  result = $ecs_meta_get_member(addr cursor.internal)

proc getMemberId*(cursor: MetaCursor): ecs_entity_t =
  ## 获取当前字段的实体 ID。
  result = ecs_meta_get_member_id(addr cursor.internal)

proc getInt*(cursor: MetaCursor): int64 =
  ## 读取当前整型字段的值。
  result = ecs_meta_get_int(addr cursor.internal)

proc getUInt*(cursor: MetaCursor): uint64 =
  ## 读取当前无符号整型字段的值。
  result = ecs_meta_get_uint(addr cursor.internal)

proc getFloat*(cursor: MetaCursor): cdouble =
  ## 读取当前浮点字段的值。
  result = ecs_meta_get_float(addr cursor.internal)

proc getString*(cursor: MetaCursor): string =
  ## 读取当前字符串字段的值。
  result = $ecs_meta_get_string(addr cursor.internal)

proc getBool*(cursor: MetaCursor): bool =
  ## 读取当前布尔字段的值。
  result = ecs_meta_get_bool(addr cursor.internal)

proc setInt*(cursor: var MetaCursor; value: int64): bool =
  result = ecs_meta_set_int(addr cursor.internal, value) != 0

proc setUInt*(cursor: var MetaCursor; value: uint64): bool =
  result = ecs_meta_set_uint(addr cursor.internal, value) != 0

proc setFloat*(cursor: var MetaCursor; value: cdouble): bool =
  result = ecs_meta_set_float(addr cursor.internal, value) != 0

proc setString*(cursor: var MetaCursor; value: string): bool =
  result = ecs_meta_set_string(addr cursor.internal, cstring(value)) != 0

proc setBool*(cursor: var MetaCursor; value: bool): bool =
  result = ecs_meta_set_bool(addr cursor.internal, value) != 0

# ──────────────────────────────────────────────────────────────────────
# 帮助构造 ecs_member_t
# ──────────────────────────────────────────────────────────────────────

proc initMember*(name: string; typeId: ecs_entity_t;
                 offset, count: int32): ecs_member_t =
  ## 构建一个字段描述符。
  result = ecs_member_t(
    name: cstring(name),
    type_field: typeId,
    offset: offset,
    count: count,
  )
