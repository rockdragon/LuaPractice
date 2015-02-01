--[[
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
--]]

local Traceback = require("DEBUGs.traceback")
Traceback.traceback()

local Inspector = require("DEBUGs.inspector")

function foo(a, b)
  local x 
  local y
  do local c = a + b end
  local a = 1
  while true do
    local n, v = debug.getlocal(1, a)
    if not n then break end
    print(n, v)
    a = a + 1
  end
  print(Inspector.getvarvalue("a"))
end

foo(10, 20)

