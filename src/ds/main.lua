local util = require("ds.util")
--[[
local set = require("ds.set")
local bag = require("ds.bag")

local a = {"yes", "no", "qa"}
local s = set.new(a)
util.iter(s)

local b = bag.new(a)
util.iter(b)
bag.add(b, "yes")
util.iter(b)

local buffer = require("ds.buffer").new()
print("please input buffer string:wo")
for line in io.lines() do
  if line ~= "" then buffer.append(line) else break end
end
print(buffer.tostring())

--]]

--[[ base control
local str1 = "hello,,world,yes,nlo"
local pos = 1, s, e
repeat
  s, e =  string.find (str1, "lo", pos)
  if s then 
    pos = e + 1 
    print(s, e)
  end  
until s == nil
--]]






