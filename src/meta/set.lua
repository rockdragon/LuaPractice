Set = {}

local mt = {} --metatable

function check(a, b)
  if getmetatable(a) ~= mt.__metatable or getmetatable(b) ~= mt.__metatable then
    error("operand must be a Set.")
  end
end

function Set.new(l)
  local set = {}
  setmetatable(set, mt)  
  for _, v in pairs(l) do set[v] = true end
  return set
end

function Set.union(a, b)
  check(a, b)
  local res = Set.new{}
  for k in pairs(a) do res[k] = true end
  for k in pairs(b) do res[k] = true end
  return res
end

function Set.intersection(a, b)
  check(a, b)
  local res = Set.new{}
  for k in pairs(a) do
    res[k] = b[k]
  end  
  return res
end

function Set.subtraction(a, b)
  check(a, b)
  local res = Set.new{}
  for k in pairs(a) do
    if not b[k] then res[k] = a[k] end
  end
  return res
end

function Set.tostring(set)
  local l = {}
  for e in pairs(set) do
    l[#l + 1] = e
  end
  return "{" .. table.concat(l, ",") .. "}"
end

function Set.print(s)
  print(s)
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__sub = Set.subtraction
mt.__tostring = Set.tostring
mt.__le = function(a, b)
  for k in pairs(a) do
    if not b[k] then return false end
  end
  return true
end
mt.__lt = function(a, b)
  return a <= b and not (b <= a)
end
mt.__eq = function(a, b)
  return a <= b and b <= a
end
mt.__metatable = "not your business."

return Set