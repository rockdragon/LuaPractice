 local comments = [[
 /*
  comments 1
 */
 /*
  comments 2
 */
 ]]
 
 print(string.match(comments, "/%*(.-)%*/"))
 
 print(string.match(comments, "/%*(.*)%*/"))
 
local r, c = string.gsub("hello lua!", "(.)(.)", "%2%1")
print(r, c)

for v in string.gmatch([[<a href="http://www.douban.com/">台北</a>]], "%b<>") do
  print(v)
end
