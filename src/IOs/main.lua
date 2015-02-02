--[[
local no = 1
for line in io.open("IOs/encoding.lua"):lines() do
  print(string.format("%02d.", no), line)
  no = no + 1
end
--]]

local BUFSIZE = 128
<<<<<<< HEAD
local line, rest 
repeat
	line, rest= io.open("IOs\\encoding.lua"):read(BUFSIZE, "*line") 
	print(line, rest)
until rest == 0

=======
local lines, rest 
local f = io.open("IOs/encoding.lua")
repeat
  lines, rest = f:read(BUFSIZE, "*l")
  print(lines)
until rest == nil
>>>>>>> 4d55a96061a7c07abba200ebb65c48cb04d0dd5e
