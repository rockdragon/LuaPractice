LinkExtractor = {}

function LinkExtractor.extract(s)
  return function()
    return string.gmatch(s, "<a href=\"([^\"]+)\">([^<]+)</a>")
  end  
end

return LinkExtractor