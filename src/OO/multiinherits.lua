--seeking key in parents
local function search(k, plist)
  for i=1, #plist do
    local v = plist[i][k]
    if v then return v end
  end
end

--
function createClass(...)
  local c = {}
  local parents = {...}
  
  setmetatable(c, {
      __index = function(t, k)
        local v = search(k, parents)
        t[k] = v -- caching for next search
        return v
      end
    })
  c.__index = c
  
  function c:new(o)
    o = o or {}
    setmetatable(o, c)
    return o
  end
  
  return c
end

local Named = {}
function Named:getname()
  return self.name
end
function Named:setname(n)
  self.name = n
end

local People = {}
function People:say()
  return " said: hi."
end

local namedPeople = createClass(Named, People)
namedPeople:say()
namedPeople:setname("Jerry")
print(namedPeople:getname() .. namedPeople:say())



