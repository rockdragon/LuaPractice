local util = require("ds.util")

local results = {}
setmetatable(results, {__mode = "kv" }) --weak ref both k&v

function mem_loadstring(s)
  local res = results[s]
  if res == nil then
    res = assert(loadstring(s))
    results[s] = res
  end  
  return res
end

function createRGB(r, g, b)
  local key = r.."-"..g.."-"..b
  local color = results[key]
  if color == nil then
    color = {red = r, green = g, blue = b}
    results[key] = color
  end
  return color
end
