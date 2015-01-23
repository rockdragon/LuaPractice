readOnly = {}

function readOnly.readOnly(t)
  local proxy = {}
  local mt = {
    __index = t,
    __newindex = function(t, k, v)
      error("attempt to update a read-only table", k)
    end
  }
  setmetatable(proxy, mt)
  return proxy

return readOnly