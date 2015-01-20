local lib = require("win")

local N = 2
local MAXGEN = 10000
local NOWORD = "\n"

local w1, w2 = NOWORD, NOWORD
for w in lib.allwords() do
  lib.insert(lib.prefix(w1, w2) w)
  w1 = w2; w2 = w
end
lib.insert(prefix(w1, w2), NOWORD)

