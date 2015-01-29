local no = 1
for line in io.open("IOs\\encoding.lua"):lines() do
  print(string.format("%02d.", no), line)
  no = no + 1
end

local BUFSIZE = 128
local line, rest 
repeat
	line, rest= io.open("IOs\\encoding.lua"):read(BUFSIZE, "*line") 
	print(line, rest)
until rest == 0

