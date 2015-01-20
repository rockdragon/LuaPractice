local socket = require("socket")
local threads = {}

function receive(connection)
  connection:settimeout(0)
  local s, status, partial = connection:receive(2^10)
  if status == "timeout" then
    coroutine.yield(connection)
  end
  return s or partial, status
end

function download(host, file)
  local c = assert(socket.connect(host, 80))
  local count = 0
  c:send("GET "..file.." HTTP/1.1\r\n\r\n")
  while true do
    local s, status = receive(c)
    count = count + #s
    if status == "closed" then break end
  end
  c:close()
  print(file, count)
end

function get(host, file)
  local co = coroutine.create(function() download(host, file) end)
  table.insert(threads, co)
end

function dispatch()
  local i = 1
  local connections = {}
  while true do
    if threads[i] == nil then
      if threads[1] == nil then break end
      i = 1
      connections = {}
    end
    local status, res = coroutine.resume(threads[i])
    if not res then
      table.remove(threads, i)
    else  -- timeout
      i = i + 1
      connections[#connections + 1] = res
      if #connections == #threads then
        socket.select(connections)
      end      
    end    
  end
end

local host = "myhost.com"

get(host, "/index.html")
get(host, "/2.html")

dispatch()