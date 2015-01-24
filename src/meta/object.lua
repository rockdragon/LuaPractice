object = {}

function getname(self, n)
    return self[n]
end

function object.new()
  local o = {}
  o.getname = getname
  setmetatable(o, {
      __index = function(self, key)
        return key .. ": default"
      end
  })
  return o
end

return object