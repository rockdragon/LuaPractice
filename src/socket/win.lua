local http = require("socket.http")

local response_body = {}
 
local res, code, response_headers =  http.request{
    method="GET",
    url = "http://myhost.com/",
    sink = ltn12.sink.table(response_body)
  }

if code == 200 then
  for k, v in pairs(response_headers) do
    print(k..":"..v)
  end
  
  --body
  for k, v in pairs(response_body) do
    print(v)
  end  
end





