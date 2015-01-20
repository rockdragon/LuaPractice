print("please input a sentence:")
local line = io.read()
local pos = 1
while line do
  local s, e = string.find(line, "%w+", pos)
  if s then
    pos = e + 1
    print(string.sub(line, s, e))
  else
    break
  end
end
