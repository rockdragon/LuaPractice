WeighingRand = {}

--[[
  input convention: 
      a table {
        ["result1"] = 10,
        ["result2"] = 20
        ...
      }
--]]

function WeighingRand.new(t)
  local pos = 0  
  local pivot = {}
  setmetatable(pivot, {
      __index = function(t, k)  -- k is a number
        if type(k) != "number" then error("should supply a numerical key.") end
        for w, r in pairs(pivot) do
          if w >= k then return r end
        end
        return nil
      end
  })
  for k, v in pairs(t) do  -- key is result, v is weight
    pivot[pos] = k
    pos = pos + v
    if pos > 100 then break end    
  end
  
  return function(k) -- interface
    return pivot[k]
  end
end

return WeighingRand