--[[
  function invocation times counter by sethook
--]]
local Counters = {}
local Names = {}

local function hook()
  local f = debug.getinfo(2, "f").func
  if Counters[f] == nil then
    Counters[f] = 1
    Names[f] = debug.getinfo(2, "Sn")
  else
    Counters[f] = Counters[f] + 1
  end
end

local f = assert(loadfile(arg[1]))
debug.sethook(hook, "c")
f()
debug.sethook()

function getname(func)
  local n = Names[func]
  if n.what == "C" then
    return n.name
  end
  local lc = string.format("[%s]:%s", n.short_src, n.linedefined)
  if n.namewhat ~= "" then
    return string.format("%s (%s)", lc, n.name)
  else
    return lc
  end
end

print("----------------function invocation times:")
for k, v in pairs(Counters) do
  print(getname(k), v)
end
