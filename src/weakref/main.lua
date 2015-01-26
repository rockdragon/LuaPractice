local util = require("ds.util")

local a = {}
local b = {__mode = "v"}
setmetatable(a, b)

local v = {}
a[1] = v
v = {}
a[2] = v

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)