# switch("define", "opirRebuild")      # 重新构建OPIR相关代码
# switch("define", "futharkRebuild")   # 重新构建Futhark相关代码
switch("define", "nodeclguards")       # 禁用声明保护
switch("define", "generateInline")     # 生成内联代码
switch("maxLoopIterationsVM", "10000000000")     # 
  
# begin Nimble config (version 2)
when withDir(thisDir(), system.fileExists("nimble.paths")):
  include "nimble.paths"
# end Nimble config
