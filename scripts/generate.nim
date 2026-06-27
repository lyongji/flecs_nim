# Futhark binding generator for Flecs
# Generates separate raw binding files per Flecs addon module
# Usage: nim c -r scripts/generate.nim
import futhark, os, strformat

const wrappersDir = currentSourcePath.parentDir.parentDir / "wrappers"
const outputDir = currentSourcePath.parentDir.parentDir / "src" / "flecs_nim"

template generateModule(name, header: string) =
  block:
    const outputPath = outputDir / &"{name}_raw.nim"
    const headerPath = wrappersDir / header
    importc:
      outputPath outputPath
      path wrappersDir
      sysPath wrappersDir
      header

generateModule("core",    "core.h")
generateModule("meta",    "meta.h")
generateModule("json",    "json.h")
generateModule("http",    "http.h")
generateModule("script",  "script.h")
generateModule("alerts",  "alerts.h")
generateModule("stats",   "stats.h")
generateModule("app",     "app.h")

echo &"Generated modules in {outputDir}"
echo "  core_raw.nim  - Core ECS (entities, queries, systems, pipeline)"
echo "  meta_raw.nim  - Meta (reflection, doc, units)"
echo "  json_raw.nim  - JSON serialization"
echo "  http_raw.nim  - HTTP server + REST API"
echo "  script_raw.nim - Flecs script"
echo "  alerts_raw.nim - Alerts monitoring"
echo "  stats_raw.nim  - Stats + metrics"
echo "  app_raw.nim    - Application framework"
