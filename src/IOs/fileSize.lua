function fileSize(f)
  local curr = f:seek()
  local size = f:seek("end")
  f:seek("set", curr)
  return size
end

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

function sizeRepr(s)
  local kb = 1000
  local mb = kb * kb
  if s < kb then return s end
  if s < mb then return fractionRound(math.floor(s / kb) + s % kb / kb, 2) .. " kb" end
  return fractionRound(math.floor(s / mb) + s % mb / mb, 2) .. " mb"
end

local size = fileSize(io.open(arg[1], "r"))
print(arg[1].." size:",  sizeRepr(size))
