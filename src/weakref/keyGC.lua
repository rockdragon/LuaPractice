--[[
  manual GC collects object key only
--]]
local util = require("ds.util")

local a = {}
local b = {__mode = "k"}
setmetatable(a, b)

----- number key
local key = 1
a[key] = 1
key = 2
a[key] = 2

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)

--------------boolean
key = true
a[key] = 1
key = false
a[key] = 2

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)

--------------string
key = "abc"
a[key] = 1
key = "def"
a[key] = 2

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)

--------------object
key = {}
a[key] = 1
key = {}
a[key] = 2

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)