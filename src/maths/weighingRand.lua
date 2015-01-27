WeighingRand = {}

--[[ 加权随机
  input convention: 
      a table {
        ["result1"] = 10,
        ["result2"] = 20
        ...
      }
--]]

function WeighingRand.new(t)
  local pos = 0
  local weighs = {}
  local pivot = {}
  pivot.locate = function(k)
    if type(k) ~= "number" then error("should supply a numerical key.") end
    local p = 0 
    for _, r in ipairs(pivot) do
      p = p + r.weight          
      if p >= k then 
        print("found:", k, "in", r.result, "range", r.weight.."~"..p)
        return r.result 
      end
    end
    return nil
  end
  --sorting first
  for k, v in pairs(t) do
    table.insert(weighs, v)
  end
  table.sort(weighs, function(a, b) return a < b end)
  weighs.pos = function(k)
    for i, v in ipairs(weighs) do
      if v == k then return i end -- return index
    end
  end
  
  for k, v in pairs(t) do  -- key is result, v is weight
    pos = pos + v
    if pos > 100 then break end    
    local i = weighs.pos(v)
    if i ~= nil then
      pivot[i] = { weight = v, result = k}
    end
  end
  
  return function() -- interface
    local r = math.random(100)
    print("random seed:", r)
    local result = pivot.locate(r)
    return result
  end
end

return WeighingRand