local util = require("ds.util")
local set = require("ds.set")
local bag = require("ds.bag")

local a = {"yes", "no", "qa"}
local s = set.new(a)
util.iter(s)

local b = bag.new(a)
util.iter(b)
bag.add(b, "yes")
util.iter(b)

local buffer = require("ds.buffer").new()
print("please input buffer string:wo")
for line in io.lines() do
  if line ~= "" then buffer.append(line) else break end
end
print(buffer.tostring())
