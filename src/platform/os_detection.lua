--[[
 operation system detection based on io.popen command
--]]
os_detection = {}

function exec(cmd)
  return io.popen(cmd):read()
end

function os_detection.name() 
  local r = exec("uname -s")
  if r == "Linux" or r == "Darwin" then
    return r
  end
  r = exec("dir")
  if r then return "Windows" end
end

return os_detection