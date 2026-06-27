# Futhark 驱动 — 生成 Flecs 模块化绑定
# =========================================
# 用法:
#   nim c -r -d:useFuthark flecs.nim
#
# 生成 src/flecs/*_raw.nim 文件，每个模块对应一个 Flecs addon。
# 生成的 _raw.nim 文件带有 when not declared 守卫，
# 可同时导入多个模块而不会产生类型重定义冲突。
import futhark

# 编译 C 源文件
{.compile: "./flecs/distr/flecs.c".}

# 链接库设置
when defined(windows):
  {.passL: "-lws2_32 -ldbghelp".}
elif defined(linux) or defined(macosx):
  {.passL: "-lm -lpthread -ldl".}

when defined(useFuthark):
  importc:
    outputPath "src/flecs/core_raw.nim"
    path "./wrappers"
    "core.h"

  importc:
    outputPath "src/flecs/meta_raw.nim"
    path "./wrappers"
    "meta.h"

  importc:
    outputPath "src/flecs/json_raw.nim"
    path "./wrappers"
    "json.h"

  importc:
    outputPath "src/flecs/http_raw.nim"
    path "./wrappers"
    "http.h"

  importc:
    outputPath "src/flecs/script_raw.nim"
    path "./wrappers"
    "script.h"

  importc:
    outputPath "src/flecs/alerts_raw.nim"
    path "./wrappers"
    "alerts.h"

  importc:
    outputPath "src/flecs/stats_raw.nim"
    path "./wrappers"
    "stats.h"

  importc:
    outputPath "src/flecs/app_raw.nim"
    path "./wrappers"
    "app.h"
else:
  # 使用预生成文件（提交到仓库）
  # 注意：首次生成前，当前 raw.nim 是全量文件（含所有 addon）
  # 重新生成后会被各 *_raw.nim 替换
  include "./src/flecs/raw.nim"
