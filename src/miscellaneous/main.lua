---[[ enumerate prime numbers up to 50
local PrimeNumber = require("miscellaneous.primeNumber")

for k in PrimeNumber.primes(50) do
  print(k)
end
--]]