--loadstring & assert
--[[
print("enter function to be plotted (with variable 'x'):")
local l = io.read()
local f = load("local x=...; return " .. l)
for i=1, 20 do
  print(string.rep("*", f(i) or i))
end
--]]


local file, status

repeat
  print "enter a file name:"
  local name = io.read()
  if not name then return end
  --file = assert(io.open(name, "r"))
  status, file = pcall(io.open, name, "r")
  --print(debug.traceback())
  if not file then print(status) end
until file

if file then 
  -- : invoking pass self to the first argument implicitly
  for line in file:lines() do
    print(line)
  end
  file:close()
end
