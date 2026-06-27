## Flecs Nim 绑定 — 主入口
##
## FLECS (https://github.com/SanderMertens/flecs) 的 Nim 绑定。
## 快速 ECS（实体组件系统）框架。
##
## 导入方式
## ========
##
##   import flecs                 # 全部功能（含 714 个原始 FFI proc）
##   import flecs/core            # 仅核心类型安全包装
##   import flecs/raw             # 仅原始 FFI 绑定
##
## 编译
## ====
##
## 本模块负责编译 flecs C 源码并链接平台系统库。

{.compile: "../flecs/distr/flecs.c".}

when defined(windows):
  {.passL: "-lws2_32 -ldbghelp".}
elif defined(linux) or defined(macosx):
  {.passL: "-lm -lpthread -ldl".}

import flecs/all
export all
