local util = require("ds.util")

local a = {}
local b = {__mode = "k"}
setmetatable(a, b)

local key = {}
a[key] = 1
key = {}
a[key] = 2

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)