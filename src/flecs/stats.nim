## Stats addon — 运行时统计
##
## 追踪运行时的统计数据（内存、实体数、表数等）。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
import raw

proc getWorldStats*(world: ptr ecs_world_t; stats: var ecs_world_stats_t) =
  ## 获取世界统计信息。
  ecs_world_stats_get(world, addr stats)
