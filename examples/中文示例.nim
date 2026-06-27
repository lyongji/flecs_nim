import flecs
import flecs/中文

# ══════════════════════════════════════════════════════════════════════
# CODING_STANDARD.md 通用宏演示
# ══════════════════════════════════════════════════════════════════════

定义Distinct类型(秒, int64)
定义Distinct类型(金额, int64)

let 过期时间: 秒 = (3600).秒
echo "过期时间: ", 过期时间.toint64, " 秒"

# 若 / 否则 模板
若 过期时间 < (7200).秒:
  echo "即将过期"

# 统计耗时
统计耗时 "测试":
  discard

# 强制命名检查（编译期）
强制命名检查:
  var 是否有效: bool = true          # ✓
  var 用户列表: seq[string] = @[]    # ✓
  # var running: bool = false        # 编译错误！

# ══════════════════════════════════════════════════════════════════════
# ECS 操作演示
# ══════════════════════════════════════════════════════════════════════

type
  位置 = object
    x, y: float64
  速度 = object
    vx, vy: float64

let 世界 = 新建世界()

世界.注册组件(位置)
世界.注册组件(速度)

let 玩家 = 世界.创建命名实体("玩家")
世界.设置组件(玩家, 位置, 位置(x: 0, y: 0))
世界.设置组件(玩家, 速度, 速度(vx: 1, vy: 2))

若 世界.是否拥有组件(玩家, 位置):
  echo "玩家位置: (", 世界.获取组件(玩家, 位置).x, ", ", 世界.获取组件(玩家, 位置).y, ")"

世界.获取可变组件(玩家, 速度).vx = 10
echo "玩家速度vx: ", 世界.获取组件(玩家, 速度).vx

# 单例
世界.添加单例(位置)
世界.设置单例(位置, 位置(x: 100, y: 200))
let sp = 世界.获取单例(位置)
if sp != nil:
  echo "单例位置: (", sp.x, ", ", sp.y, ")"

# 查询 + 迭代
let q = 世界.按条件查询(
  ecs_term_t(id: 组件ID(位置)),
  ecs_term_t(id: 组件ID(速度)),
)
echo "查询结果:"
for it in q.items:
  var 实体组 = cast[ptr UncheckedArray[ecs_entity_t]](it.实体列表)
  for i in 0 ..< it.计数:
    let e = 实体组[i]
    let p = 世界.获取组件(e, 位置)
    let v = 世界.获取组件(e, 速度)
    echo "  (", p.x, ", ", p.y, ") v=(", v.vx, ", ", v.vy, ")"

# 按ID遍历
echo "所有拥有位置的实体:"
for it in 世界.按ID遍历(组件ID(位置)):
  var 实体组 = cast[ptr UncheckedArray[ecs_entity_t]](it.实体列表)
  for i in 0 ..< it.计数:
    let e = 实体组[i]
    if 世界.是否拥有组件(e, 位置):
      let p = 世界.获取组件(e, 位置)
      echo "  实体 ", e, " 位置 (", p.x, ", ", p.y, ")"

# 创建系统 + 运行
proc 移动系统(it: ptr ecs_iter_t) {.cdecl.} =
  var ids = cast[ptr UncheckedArray[ecs_id_t]](it.ids)
  for i in 0 ..< it.count:
    let e = cast[ptr UncheckedArray[ecs_entity_t]](it.entities)[i]
    let p = cast[ptr 位置](ecs_get_mut_id(it.world, e, ids[0]))
    let v = cast[ptr 速度](ecs_get_id(it.world, e, ids[1]))
    p.x += v.vx
    p.y += v.vy

let 系统ID = 世界.创建系统(ecs_system_desc_t(
  callback: 移动系统,
  query: ecs_query_desc_t(
    terms: ecs_terms(ecs_term_t(id: 组件ID(位置)), ecs_term_t(id: 组件ID(速度))),
  ),
))
世界.运行系统(系统ID)
echo "移动后: (", 世界.获取组件(玩家, 位置).x, ", ", 世界.获取组件(玩家, 位置).y, ")"

世界.推进一帧()
echo "完成!"
