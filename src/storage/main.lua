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

--[[
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
      if k ~= #o then io.write(",\n") end
    end
    io.write("\n}")
  else
    error("cannot serialize a " .. type(o))
  end   
end

local t = {"1", "2", "hello", 1, 3}
local f = io.open("storage\\fdata", "a+")
io.output(f)
serialize(t)
f:close()
--]]


function basicSerialize(o)
  if type(o) == "number" then
    return tostring(o)
  else
    return string.format("%q", o)
  end  
end

function save(name, value, saved)
  saved = saved or {}
  io.write(name, "=")
  if type(value) == "number" or type(lvalue) == "string" then
    io.write(basicSerialize(value), "\n")
  elseif type(value) == "table" then
    if saved[value] then
      io.write(saved[value], "\n")
    else
      saved[value] = name
      io.write("{}\n")
      for k, v in pairs(value) do
        k = basicSerialize(k)
        local name = string.format("%s[%s]", name, k)
        save(fname, v, saved)
      end      
    end
  else
    error("cannot save a " .. type(value))
  end 
end

local a = { x = 1, y = 2; {3, 4, 5}}
a[2] = a
a.z = a[1]

save("a", a)
