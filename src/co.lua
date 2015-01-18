--[[
coroutine exploration.
  
  coroutine status:
    1. suspended
    2. running
    3. dead
    4. normal
--]]

function readFile(name, mode)
  return io.open(name, mode)
end

print "enter a file name:"
local name = io.read()
co = coroutine.create(function() pcall(readFile, name, "r") end)
coroutine.resume(co) -- execution
print(coroutine.status(co))
