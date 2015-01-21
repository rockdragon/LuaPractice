bag = {}

function bag.new(list)
  local b = {}
  for _, v in pairs(list) do b[v] = 1 end
  return b
end

function bag.add(b, k)
  b[k] = (b[k] or 0) + 1
end

function bag.remove(b, k)
  local count = b[k]
  b[k] = (count and count > 1) and count - 1 or nil
end

return bag