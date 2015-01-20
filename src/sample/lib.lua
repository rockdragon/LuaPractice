module = {}

function module.allwords()
  print("please a sentence:")
  local line = io.read()
  local pos = 1
  return function()
    while line do
      local s, e = string.find(line, "%w+", pos)
      if s then
        pos = e + 1
        return string.sub(line, s, e)
      else 
        break
      end
    end
    return nil
  end
end

function module.prefix(w1 ,w2)
  return w1 .. " " .. w2
end

module.statetab = {}

function module.insert(index, value)
  local list = module.statetab[index]
  if list == nil then 
    module.statetab[index] = value
  else
    module.statetab[#list + 1] = value
  end
end

return module