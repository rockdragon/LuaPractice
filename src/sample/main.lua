local lib = require("sample.lib")

local N = 2
local MAXGEN = 10000
local NOWORD = "\n"

-- construct table
local w1, w2 = NOWORD, NOWORD
for w in lib.allwords() do
  lib.insert(lib.prefix(w1, w2), w)
  w1 = w2; w2 = w
end
lib.insert(prefix(w1, w2), NOWORD)

-- generate text
w1 = NOWORD; w2 = NOWORD    --re-init
for i=1, MAXGEN do
  local list = lib.statetab[lib.prefix(w1, w2)]
  -- random choice 
  local r = math.random(#list)
  local nextword = list[r]
  if nextword == NOWORD then return end
  io.write(nextword, " ")
  w1 = w2; w2 = NOWORD
end
