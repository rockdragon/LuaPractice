--loadstring & assert
print("enter function to be plotted (with variable 'x'):")
local l = io.read()
local f = assert(loadstring("return ".. l))
for i=1, 20 do
  x = i
  print(string.rep("*", f() or i))
end

  
