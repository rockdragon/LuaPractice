local util = require("ds.util")

a = {}
b = {__mode = "k"}
setmetatable(a, b)

key = {}
a[key] = 1
key = {}
a[key] = 2

print("", "before GC:")
util.iter(a)
collectgarbage();
print("", "after GC:")
util.iter(a)