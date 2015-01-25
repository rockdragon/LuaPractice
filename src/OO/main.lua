--[[
  Object-oriented exploration.
--]]
local object = require("oo.object")
local instance1 = object.new()
print(instance1:getname("mike"))

local instance2 = object.new()
instance2.lily = "yes"
print(instance2:getname("lily"))

print(instance1:getname("lily"))