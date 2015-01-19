--[[
coroutine exploration.
  
  coroutine status:
    1. suspended
    2. running
    3. dead
    4. normal
--]]

function readFile(name, mode)
  local r, msg = io.open(name, mode)
  if not r then
    print(msg)
  end
  coroutine.yield(r)
end

print "enter a file name:"
local name = io.read()
local co = coroutine.create(readFile)
local status, file = coroutine.resume(co, name, "r") -- executing until yield
if status and file then
  for line in file:lines() do
    print(line)
  end
end

coroutine.resume(co) --turn to [dead]
print(coroutine.status(co))

status = coroutine.resume(co)
print(status)
