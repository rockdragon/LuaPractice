Inspector = {}

function Inspector.getvarvalue(name)
  local value, found
  
  -- through local variable
  for i=1, math.huge do
      local n, v = debug.getlocal(2, i)
      if not n then break end
      if n == name then
        value = v
        found = true
      end
  end
  if found then return value end
  
  -- through global variable
  local func = debug.getinfo(2, "f").func
  for i=1, math.huge do
    local n, v = debug.getupvalue(func, i)
    if not n then break end
    if n == name then return v end
  end
end

return Inspector