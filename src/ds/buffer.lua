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

function buffer.tostring(delimiter)
  return table.concat(buffer.__buf, delimiter or ",")
end

return buffer