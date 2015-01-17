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

local numbers = {
  ["Monday"]=1, ["Tuesday"]=2, ["Wednesday"]=3, ["Thursday"]=4, ["Friday"]=5, ["Saturday"]=8, ["Sunday"]=7}
  --]]
  
--[[
function iterateK(t)
  for k in pairs(t) do
    print(k.."="..t[k])
  end
end

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

function p(...)  
  for k, v in ipairs{...} do
    print(k, v)
  end
end

p("w", "h", "y")

function z(...)
  local arg = {...}
  return arg
end

w = z(1,2,3)
print(unpack(w))

function rename(arg)
  print(arg.old, arg.new)
end
rename{old="hello", new="world"}
--]]

--[[closure
names = {"Peter", "Paul", "Mary"} 
print("before sorting:",unpack(names))
grades = {Mary = 10, Paul = 7, Peter = 8} 
table.sort(names, function(a, b) return grades[a] > grades[b] end)
print("after sorting:", unpack(names))
--]]

--closure
--[[
function powerOfN(n)
  return function(m)
    local result = 1
    for i=1, n do
      result = result * m
    end
    return result
  end
end

print("M:")
local m = io.read("*number")
print("M的N:")
local n = io.read("*number")
if m and n then
  local power = powerOfN(n)
  print("结果："..power(m))
end
--]]


--尾递归
function foo(n, m)
  if n > 0 then
    return foo(n-1, n + m)
  else 
    return m
  end
end
print("accumulation:" .. foo(5, 0))


function fibonacci(n, acc1, acc2)
  if n <=2 then
    return acc1
  else
    return fibonacci(n-1, acc1 + acc2, acc1)
  end
end
print("Fibonacci:" .. fibonacci(8, 1, 1))