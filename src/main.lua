
--[[
function allwords()
  print("input:")
  local line = io.read()
  local pos = 1
  return function()
    while line do
      local s, e = string.find(line, "%w+", pos)
      if s then
        pos = e + 1
        return string.sub(line, s, e)
      else
        line = io.read()
        pos = 1
      end
    end
  end
end

local s = allwords()
print(s())
--]]





--迭代器调用
local lib = require("iterator")
local list = {"hello", "nerd", "geneartion."}

for k, v in lib.traverse(list) do
  print(k, v)
end

