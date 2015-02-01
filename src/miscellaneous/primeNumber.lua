--[[
  finite prime generator by coroutine
--]]

PrimeNumber = {}

function isPrime(i)
  local up = math.floor(math.sqrt(i))
  for j=2, up do
    if i % j == 0 then return false end
  end
  return true
end

function getPrime(up)
  for i = 2, up do
    if isPrime(i) then coroutine.yield(i) end
  end
end

function PrimeNumber.primes(up)
  local co = coroutine.create(function() getPrime(up) end)
  return function()
    local code, res = coroutine.resume(co)
    return res
  end
end

return PrimeNumber