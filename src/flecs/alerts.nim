## Alerts addon — 告警监控
##
## 监控组件条件，触发告警。需配合 meta 反射描述使用。
## 所有原始 FFI 通过 `import flecs/raw` 获得。
import raw

proc createAlert*(world: ptr ecs_world_t; name: string;
                  desc: ecs_alert_desc_t): ecs_entity_t =
  ## 创建一个告警。
  var d = desc
  var edesc = ecs_entity_desc_t(name: cstring(name))
  d.entity = ecs_entity_init(world, addr edesc)
  result = ecs_alert_init(world, addr d)
