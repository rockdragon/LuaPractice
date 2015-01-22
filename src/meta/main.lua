local Set = require("meta.set")

local s1 = Set.new{10, 20, 30, 50}
local s2 = Set.new{2, 3, 6}

print(getmetatable(s1))
print(getmetatable(s2))