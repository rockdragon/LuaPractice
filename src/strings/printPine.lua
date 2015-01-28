function print_pine(count, lines)
  return function()
    for i = 1, lines do  
      local num = 1 + (i-1) * 2
      local space_num = count - i + 1
      io.write(string.rep(" ", space_num)) 
      io.write(string.rep("*", num))  
      io.write("\n")
    end
  end
end

--[[
      *
     ***
    *****
   *******
  *********
 ***********
--]]
local darw = print_pine (21, 20)
darw()