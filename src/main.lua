--loadstring & assert
print("enter function to be plotted (with variable 'x'):")
local l = io.read()
local f = load("local x=...; return " .. l)
for i=1, 20 do
  print(string.rep("*", f(i) or i))
end

  
