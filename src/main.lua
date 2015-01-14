local lib = require("lib")

--[[
  测试
--]]
print("5!=" .. lib.factWithTail(5, 1))

print("please input a number:")
a = io.read("*number")
print("your input length:"..#tostring(a))