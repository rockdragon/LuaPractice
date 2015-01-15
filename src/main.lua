local lib = require("lib")

--[[
  测试
--]]
print("5!=" .. lib.factWithTail(5, 1))

--[[
local days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}

for i=1, #(days) do
  print("day:" .. days[i])
end

print("please input a number(1-7):")
local i = io.read("*number")

print(days[i % 7])
--]]



local a, b = 1, 10
if a < b then
  print(a)
  local a
  print(a)
end
print(a, b)