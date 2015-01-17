module = {}

--[[
  for-in expected input args:
    1, iterator
    2, table
    3, position
  for-in output result:
    k, v
--]]
function module.traverse(list, init)
  init = init or nil
  return next, list, init
end

return module
