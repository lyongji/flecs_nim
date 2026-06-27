#!/usr/bin/env bash
# 重新生成所有 Flecs 绑定
#
# 清理 -> 生成 -> 完成
# 生成的 _raw.nim 文件需提交到仓库。
set -euo pipefail
cd "$(dirname "$0")/.."

echo "=== 清理旧的 raw 文件 ==="
rm -f src/flecs_nim/*_raw.nim

echo "=== 用 Futhark 生成模块化绑定 ==="
nim c -r -d:useFuthark flecs.nim

echo ""
echo "=== 完成 ==="
echo "生成的文件:"
ls -lh src/flecs_nim/*_raw.nim
