UrlUtils = {}

function UrlUtils.unescape(url)
  return string.gsub(url, "%%(%x%x)", function(x)    
      return string.char(tonumber(x, 16))
    end)
end

function UrlUtils.escape(url)
  url =  string.gsub(url, "[&=+%%%c]", function(c)
      return string.format("%%%02X", string.byte(c))
    end)
  url = string.gsub(url, " ", "+")
  return url  
end

---[[ demo
local url = [[http://dict.youdao.com/search?le=eng&q=%E6%91%A9%E6%93%A6&keyfrom=dict.top]]
local r = UrlUtils.unescape(url)
print(r)
--]]

r = UrlUtils.escape(r)
print(r)

return UrlUtils
