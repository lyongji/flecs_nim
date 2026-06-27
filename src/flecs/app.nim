## App addon — 应用框架
##
## 简化 Flecs 应用的初始化与运行循环。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
import raw

proc runApp*(world: ptr ecs_world_t; targetFps: cfloat = 60.0;
             deltaTime: cfloat = 0.0; threads: int32 = 0): bool =
  ## 运行应用主循环，直到窗口关闭。
  var desc = ecs_app_desc_t(
    target_fps: targetFps,
    delta_time: deltaTime,
    threads: threads,
  )
  result = ecs_app_run(world, addr desc) == 0

proc runAppFrame*(world: ptr ecs_world_t; targetFps: cfloat = 60.0;
                  deltaTime: cfloat = 0.0): bool =
  ## 运行单帧。
  var desc = ecs_app_desc_t(
    target_fps: targetFps,
    delta_time: deltaTime,
  )
  result = ecs_app_run_frame(world, addr desc) == 0
