object = {}

local object_meta = {}
function object_meta:getname(n)
    return self[n]
end

function object.new()
  local o = {}
  setmetatable(o, {
    __index = object_meta
  })
  return o
end

return object