function newObject(value)
  return function(action, v)
    if action == "get" then 
      return value
    elseif action == "set" then 
        value = v
    else 
        error("invalid action.")
    end
  end
end

local o = newObject(10)
print(o("get"))
o("set", 20)
print(o("get"))
