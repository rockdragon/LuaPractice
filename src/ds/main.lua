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
buffer.concat({"started", "LuaPractice", "workspace" ,"main"})
print(buffer.tostring())
