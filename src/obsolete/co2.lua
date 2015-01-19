--[[
  coroutine app #1
--]]
function gen(n)
  local i = 1
  repeat 
    coroutine.yield(i)
    i = i + 1
  until i > n  
end

function iter(n)
  local co = coroutine.create(function() gen(n) end)
  return function()
    local s, res = coroutine.resume(co)
    return res
  end
end

local i = iter(10)
local r = i()
while r do
  print(r)
  r = i()
end
