--[[ load data
local authors = {}
function Entry (b) authors[b.author] = true end
dofile("storage\\data")
for name in pairs(authors) do print(name) end
--]]

--[[
function quote(s)
  local n = -1
  for w in string.gmatch(s, "]=*") do
    n = math.max(n, #w - 1)
  end
  local eq = string.rep("=", n + 1)
  return string.format(" [%s[\n%s]%s] ", eq, s, eq)
end

local s = "hello,2b,www"
print(quote(s))
--]]



function serialize(o)
  if type(o) == "number" then
    io.write(o)
  elseif type(o) == "string" then
    io.write(string.format("%q", o))
  elseif type(o) == "table" then
    io.write("{\n")
    for k, v in pairs(o) do
      io.write(" ", k , "=")
      serialize(v)
      io.write(",\n")
    end
    io.write("\n}")
  else
    error("cannot serialize a " .. type(o))
  end   
end

local t = {"1", "2", "hello", 1, 3}
serialize(t)