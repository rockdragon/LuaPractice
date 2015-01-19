module = {}

--[[
  for-in expected input args:
    1, iterator
    2, table
    3, position
    
    ==> in each of iteration, for-in uses the iterator look like iterator(table, position)
    ==>   itertaor is responsible for auto-incresing position
    
  for-in output result:
    k, v
    
    ==> iteration will be terminated when k is nil
--]]
function getnext(list, pos)
  pos = pos + 1
  local v = list[pos]
  if v then 
    return pos, v
  end
end

function module.traverse(list)
  return getnext, list, 0
end

return module

--迭代器调用
--[[
local lib = require("iterator")
local list = {"hello", "nerd", "geneartion."}

for k, v in lib.traverse(list) do
  print(k, v)
end
--]]
