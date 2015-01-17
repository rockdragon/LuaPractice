module = {}

--[[
  for-in expected input args:
    1, iterator
    2, table
    3, position
    
    ==> in each of iteration, for-in uses the iterator as iterator(table, position)
    ==>   itertaor is responsible for auto-incresing position
    
  for-in output result:
    k, v

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
