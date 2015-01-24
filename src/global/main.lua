--dofile("global/detection.lua")
--print(_G.haha)

--[[
local debugInfo = require("global.debugInfo")
debugInfo.test()  -- main

function inFunc()
  debugInfo.test()
end

inFunc()  -- Lua

print(debug.getinfo(2).what) -- C
--]]

dofile("global/strict.lua")
_G.gaga = "haha"
print(_G.gaga)

for k, v in pairs(package.loaded) do
  print(k, v)
end
