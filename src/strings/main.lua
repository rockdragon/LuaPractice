
local str = "Hello."
print(str:upper())

local count = 19

for i = 1, 10 do  
  local num = 1 + (i-1) * 2
  local space_num = count - i + 1
  io.write(string.rep(" ", space_num)) 
  io.write(string.rep("*", num))  
  io.write("\n")
end
