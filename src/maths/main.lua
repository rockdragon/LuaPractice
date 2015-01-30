local WeighingRand = require("maths.WeighingRand")

local rand = WeighingRand.new({
      ["A"] = 5,
      ["B"] = 10,
      ["C"] = 15,
      ["D"] = 20,
      ["E"] = 50
})

for i=1, 10 do
  print(rand())
end

collectgarbage()
print(rand())

--[[
  round with fractional precision
--]]
function fractionRound(num, n)
  local int, mod = math.modf(num)
  print(int, mod)
  if n > 0 then
    local scale = math.pow(10, n)
    local int2, mod2 = math.modf(mod * scale)
    if mod2 > 0.5 then int2 = int2 + 1 end
    return int + int2 / scale
  elseif n == 0 then return int end
end