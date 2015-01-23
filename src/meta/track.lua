Track = {}

local _t = {}

local mt = {
  __index = function(t, k)
    print("* access to element " .. tostring(k))
    return _t[k]
  end,
  __newindex = function(t, k, v)
    print("* update of element " .. tostring(k) .. " to " .. string.format("%q", v))
    _t[k] = v
  end  
}

function Track.new(o)
  setmetatable(o, mt)
  return o
end

return Track