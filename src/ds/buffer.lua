buffer = {}

buffer.__buf = {}

function buffer.new()
  buffer.__buf = {}
  return buffer
end

function buffer.concat(list)
  for _, v in pairs(list) do
    table.insert(buffer.__buf, tostring(v))
  end  
end

function buffer.append(v)
  table.insert(buffer.__buf, tostring(v))
end

function buffer.tostring()
  local res = ""
  for _, v in pairs(buffer.__buf) do
    res = res .. v
  end
  return res
end

return buffer