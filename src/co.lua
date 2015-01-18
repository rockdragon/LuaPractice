--[[
coroutine exploration.
  
  coroutine status:
    1. suspended
    2. running
    3. dead
    4. normal
--]]

function readFile(name, mode)
  local r = io.open(name, mode)
  coroutine.yield(r)
end

print "enter a file name:"
local name = io.read()
co = coroutine.create(function() pcall(readFile, name, "r") end)
status, file = coroutine.resume(co) -- executing until yield
if status and file then
  for line in file:lines() do
    print(line)
  end
end

coroutine.resume(co) --turn to [dead]
print(coroutine.status(co))
