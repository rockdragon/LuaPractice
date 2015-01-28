local LinkExtractor = require("strings.linkExtractor")

local html = "<a href=\"http://book.douban.com/subject/20536784/\">The Shape of the New</a><a href=\"http://www.douban.com/\">台北</a>"
local extractor = LinkExtractor.extract(html)

for link, title in extractor() do
  print(link, title)
end
