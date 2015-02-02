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

print("----------------function invocation times:")
for k, v in pairs(Names) do
  if v.name then
    print(v.name, "\t\t", Counters[k])
  end
end
