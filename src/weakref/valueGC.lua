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

--------------string
v = "abc"
a[3] = v
v = "def"
a[4] = v

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)

--------------number
v = 1
a[5] = v
v = 2
a[6] = v

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)

--------------boolean
v = true
a[7] = v
v = false
a[8] = v

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)
