local util = require("ds.util")

local str = "www.www.ww_"

--[[
  regular expression grouping based on the pairs of brackets
--]]
for w, d in string.gmatch(str, "([%w]+)(%.?)") do
  print(w, d)
end
