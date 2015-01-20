function allwords()
  print("please input a sentence:")
  local line = io.read()
  local pos = 1
  return function()
    while line do
      local s, e = string.find(line, "%w+", pos)
      if s then
        pos = e + 1
        print(string.sub(line, s, e))
      else
        line = io.read()
        pos = 1
      end
    end
    return nil
  end
end

function prefix(w1, w2)
  return w1 .. " " .. w2
end

local statetab = {}

function insert(index, value)
  local list = statetab[index]
  if list == nil then
    statetab[index] = {value}
  else
    list[#list + 1] = value
  end
end
