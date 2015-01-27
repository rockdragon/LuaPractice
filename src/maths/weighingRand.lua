WeighingRand = {}

--[[ 加权随机
  要求输入: 
      a table {
        ["result1"] = 10,
        ["result2"] = 20
        ...
      }
--]]

---[[生成 用于查找的轴表
function new_pivot_table()
  local pivot_meta = {}  
  function pivot_meta:locate(k)
    if type(k) ~= "number" then error("should supply a numerical key.") end
    local p = 0 
    for _, r in ipairs(self) do
      p = p + r.weight          
      if p >= k then 
        print("found:", k, "in", r.result, "range", r.weight.."~"..p)
        return r.result 
      end
    end
    return nil
  end
  
  -- source { key is result, v is weight}  
  function pivot_meta:shift_in(source, ordered)  
    local pos = 0  
    for k, v in pairs(source) do 
      pos = pos + v
      if pos > 100 then break end    
      local i = ordered:pos(v)
      if i ~= nil then
        self[i] = { weight = v, result = k}
      end
    end
  end
    
  local pivot_table = {}
  setmetatable(pivot_table, { __index = pivot_meta })
  return pivot_table;
end
--]]

---[[ 将无序表转为有序结构 {1: 5, 2: 10...}
function make_ordered(t)
  local ordered_meta = {}
  function ordered_meta.pos(self, k)
    for i, v in ipairs(self) do
      if v == k then return i end -- return index
    end
  end
  
  local ordered = {}
  for k, v in pairs(t) do
    table.insert(ordered, v)
  end
  table.sort(ordered, function(a, b) return a < b end)
  setmetatable(ordered, { __index = ordered_meta })
  return ordered
end
--]]

---[[ 产生一个随机数生产器
function WeighingRand.new(source)    
  local ordered = make_ordered(source)
  local pivot_table = new_pivot_table()
  pivot_table:shift_in(source, ordered)
  
  return function() -- interface
    local r = math.random(100)
    print("random seed:", r)
    return pivot_table:locate(r)    
  end
end
--]]

return WeighingRand