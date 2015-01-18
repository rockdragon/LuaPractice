--[[
  equivalent to 
        a ? b : c
--]]
function ternary(a, b, c)
  return (a and {b} or {c})[1]
end

function ternary2(a, b, c)
  if a then return b else return c end
end

local a = 1
local b = 10
local c = 20
print(ternary(a, b, c))

b = nil
print(ternary(a, b, c))
