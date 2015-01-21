local set = require("ds.set")

function iter(a)
  for k, v in pairs(a) do
    print(k, v)
  end
end

local a = {"yes", "no", "qa"}
local s = set.new(a)
iter(s)