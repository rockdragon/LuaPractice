local lib = require("lib")

--[[
print("5!=" .. lib.factWithTail(5, 1))
--]]

--[[
local days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}

for i=1, #(days) do
  print("day:" .. days[i])
end

print("please input a number(1-7):")
local i = io.read("*number")

print(days[i % 7])

local a, b = 1, 10
if a < b then
  print(a)
  local a
  print(a)
end
print(a, b)
--]]

local numbers = {1, 2, 3, 4, 5, 6, 8}
function iterate(list)
  for k, v in ipairs(list) do
    print(k.."="..v)
  end
end
iterate(numbers)