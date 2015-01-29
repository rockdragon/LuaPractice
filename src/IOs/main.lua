local no = 1
for line in io.open("IOs\\encoding.lua"):lines() do
  print(string.format("%02d.", no), line)
  no = no + 1
end

