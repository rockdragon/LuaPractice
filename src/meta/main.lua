--[[
local Set = require("meta.set")

local s1 = Set.new{10, 20, 30, 50}
local s2 = Set.new{2, 3, 6, 10}

--并集
local s3 = s1 + s2
Set.print(s3)

--交集
local s4 = s1 * s2
Set.print(s4)

--差集
local s5 = s1 - s2
Set.print(s5)

--类型检查
--local s6 = s1 + {1, 2}

--相等性
print(s1 < s2)
print(s2 < s1)
print(s2 == s1)

--保护metatable
print(getmetatable(s1))
--setmetatable(s1, {})
--]]


local Window = require("meta.window")

local w = Window.new{x=10, y=20}
print(w.x, w.width)
print(rawget(w, width))

w.name = "aho"
print(Window.prototype.name)
rawset(w, "xxx", "mamai")
print(w.xxx)
