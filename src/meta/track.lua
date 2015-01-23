Track = {}

t = {}
local _t = t -- preserve a private accessor

local mt = {
  __index = function(t, k)
    print("* access to element " .. tostring(k))
    return _t[k]
  end,
  __newindex = function(t, k, v)
    print("* update of element " .. tostring(k))
    _t[k] = v
  end  
}

return Track