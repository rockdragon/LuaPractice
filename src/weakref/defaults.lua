local util = require("ds.util")

local defautls = {}

setmetatable(defautls, { __mode="k" })
local mt = { __index = function(t) return defautls[t] end }

function setDefaults(t, d)
  defautls[t] = d
  setmetatable(t, mt)
end

local key = {}
setDefaults(key, "1")
key = {}
setDefaults(key, "2")
util.iter(defautls)

collectgarbage();

util.iter(defautls)


local metas = {}
setmetatable(metas, {__mode = "v" } )
function setDefaults2(t, d)
  local mt = metas[d]
  if mt == nil then
    mt = {__index = function() return d end}
    metas[d] = mt
  end
  setmetatable(t, mt)
end
