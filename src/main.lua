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

function iterateK(t)
  for k in pairs(t) do
    print(k.."="..t[k])
  end
end

local numbers = {
  ["Monday"]=1, ["Tuesday"]=2, ["Wednesday"]=3, ["Thursday"]=4, ["Friday"]=5, ["Saturday"]=6, ["Sunday"]=7}
function reverseTable(t)
  local rt = {}
  for k in pairs(t) do
    local v = t[k]
    rt[v] = k
  end
  return rt
end

local reverseNumbers = reverseTable(numbers)
iterateK(reverseNumbers)
