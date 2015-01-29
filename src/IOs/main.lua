--[[
local no = 1
for line in io.open("IOs/encoding.lua"):lines() do
  print(string.format("%02d.", no), line)
  no = no + 1
end
--]]

local BUFSIZE = 128
local lines, rest 
local f = io.open("IOs/encoding.lua")
repeat
  lines, rest = f:read(BUFSIZE, "*l")
  print(lines)
until rest == nil