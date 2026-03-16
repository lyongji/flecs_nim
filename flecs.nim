# 使用 Futhark 生成 Flecs 绑定
# 编译命令:
# nim c -r  -d:useFuthark binds.nim   
# nim c --cc:clang  -d:useFuthark binds.nim
import futhark
# 编译 C 源文件 - 假设你有 flecs.c 和 flecs.h 文件
{.compile: "/flecs/distr/flecs.c".}

# 链接库设置
when defined(windows):
  {.passL: "-lws2_32 -ldbghelp".}
# elif defined(linux):
#   {.passL: "-lm".}
# elif defined(macosx):
#   {.passL: "-lm".}

# 使用 Futhark 导入 C 头文件   
when defined(useFuthark):
  importc:
    outputPath "src/flecs_nim.nim"  # 生成的 Nim 绑定文件
    path "./flecs/distr/"  # 当前目录
    "flecs.h"
    # 重命名回调（可选）
    # renameCallback futharkRenameToSnakeCase
else:
  # 包含已生成的绑定文件
  include "./src/flecs_nim.nim"
