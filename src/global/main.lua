--dofile("global/detection.lua")
--print(_G.haha)

local debugInfo = require("global.debugInfo")
debugInfo.test()  -- main

function inFunc()
  debugInfo.test()
end

inFunc()  -- Lua

print(debug.getinfo(2).what) -- C