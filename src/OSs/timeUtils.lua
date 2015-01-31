TimeUtils = {}

--[[
  round with fractional precision
--]]
function fractionRound(num, n)
  local int, mod = math.modf(num)
  if n > 0 then
    local scale = math.pow(10, n)
    local int2, mod2 = math.modf(mod * scale)
    if mod2 > 0.5 then int2 = int2 + 1 end
    return int + int2 / scale
  elseif n == 0 then return int end
end

function TimeUtils.milliseconds(job)
  local start = os.clock()
  job()
  return (os.clock() - start) / 10^3
end

return TimeUtils