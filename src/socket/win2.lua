local socket = require("socket")

local host = "localhost"
local path = "/index.html"

local c = assert(socket.connect(host, 80))
c:send("GET"..path.." HTTP/1.1\r\n\r\n")

while true do
  local s, status, partial = c:receive(2^10)
  io.write(s or partial)
  if status == "closed" then break end
end

