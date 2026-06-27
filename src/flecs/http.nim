## HTTP addon — HTTP 服务器 + REST API
##
## 轻量级 HTTP 服务器，用于远程连接和调试 Flecs 应用。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
import raw

# ──────────────────────────────────────────────────────────────────────
# HTTP 服务器
# ──────────────────────────────────────────────────────────────────────

type
  HttpServer* = object
    ## HTTP 服务器句柄。`=destroy` 调用 `ecs_http_server_fini`。
    internal: ptr ecs_http_server_t

proc `=destroy`*(srv: var HttpServer) =
  if srv.internal != nil:
    ecs_http_server_fini(srv.internal)
    srv.internal = nil

proc newHttpServer*(port: uint16; sendQueueWaitMs: int32 = 1): HttpServer =
  ## 在 `port` 端口启动 HTTP 服务器。
  var desc = ecs_http_server_desc_t(port: port, send_queue_wait_ms: sendQueueWaitMs)
  result.internal = ecs_http_server_init(addr desc)

proc dequeue*(srv: var HttpServer; deltaTime: cfloat = 0.0) =
  ## 处理接收到的 HTTP 请求（应在主循环中调用）。
  ecs_http_server_dequeue(srv.internal, deltaTime)

# ──────────────────────────────────────────────────────────────────────
# REST API
# ──────────────────────────────────────────────────────────────────────

proc restServerInit*(world: ptr ecs_world_t;
                     desc: ecs_http_server_desc_t): ptr ecs_http_server_t =
  ## 使用 `desc` 配置启动 REST API HTTP 服务器。
  ## `ecs_rest_server_init` 内部创建 HTTP 服务器。
  result = ecs_rest_server_init(world, addr desc)
