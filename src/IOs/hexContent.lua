local f = assert(io.open(arg[1], "rb"))
local block = 16
while true do
  local bytes = f:read(block)
  if not bytes then break end
  for _, b in ipairs{string.byte(bytes, 1, -1)} do
    io.write(string.format("%02X", b))
  end
  io.write(string.rep(" ", block - string.len(bytes)))
  io.write(" ", string.gsub(bytes, "%c", "."), "\n")
end

--[[ format:
23000000240000002500000026000000 #...$...%...&...
2700000028000000290000002A000000 '...(...)...*...
2B0000002C0000002D0000002E000000 +...,...-.......
2F000000300000003100000032000000 /...0...1...2...
33000000340000003500000036000000 3...4...5...6...
37000000380000003900000000000040 7...8...9......@
--]]