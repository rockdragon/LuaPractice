local lib = require("DEBUGs.lib")

lib.print()

function printDebugInfo()
  print()
  local debugInfo = lib.test()
  print("what", debugInfo.what)
  print("name", debugInfo.name)
  print("namewhat", debugInfo.namewhat)
  print("func", debugInfo.func)
  print("source", debugInfo.source)
  print("short_src", debugInfo.short_src)
  print("linedefined", debugInfo.linedefined)
  print("lastlinedefined", debugInfo.lastlinedefined)
  print("currentline", debugInfo.currentline)  
  
end

printDebugInfo()