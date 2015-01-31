--[[
local Sleep = require("OSs.sleep")

print("now :" .. os.date(), "sleep 10 seconds...")
Sleep.sleep(10)
print("I'm awake. now:" .. os.date())
--]]

--print(os.date("%Y-%m-%d %H:%M:%S"))

local moss = require("strings.moss")
local timeUtils = require("OSs.timeUtils")
local seconds =  timeUtils.milliseconds(moss.execute)
print("milliseconds:", seconds)
