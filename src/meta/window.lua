Window = {}

Window.prototype = { x=0, y=0, width=100, height=100 }
Window.mt = {}

function Window.setDefault(o, d)
  local mt = {__index = function() return d end}
  setmetatable(o, mt)
  return o
end

function Window.new(o)
  setmetatable(o, Window.mt)
  return o
end

Window.mt.__index = function(table, key)
  print("__index")
  return Window.prototype[key]
end

Window.mt.__newindex = Window.prototype

return Window