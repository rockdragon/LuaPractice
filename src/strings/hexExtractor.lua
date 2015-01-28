HexExtractor = {}

function HexExtractor.restore(url)
  return string.gsub(url, "%%(%x%x)", function(x)    
      return string.char(tonumber(x, 16))
    end)
end

---[[ demo
local url = [[http://dict.youdao.com/search?le=eng&q=%E6%91%A9%E6%93%A6&keyfrom=dict.top]]
local r = HexExtractor.restore(url)
print(r)
--]]

return HexExtractor
