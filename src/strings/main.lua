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

print(tonumber("ff", 16))

a = true
print((a and {"2"} or {"3"})[1])

print(string.match("hello", "()ll()"))

--[[
local str = ";$& **#$hello13"
local i, j = string.find(str, "%a+")
print(i, j)
print(string.sub(str, i, j))

--]]

local str = [[This is a (mostly) pure JavaScript implementation of the WebSocket protocol versions 8 and 13 for Node. There are some example client and server applications that implement various interoperability testing protocols in the "test/scripts" folder.]]
print(string.gsub(str, "(%W)", "%%%1"))

str = [[follows a typical string: "This is \"great\"!"]]
print(string.gsub(str, "\\(.)", function(x)
      return string.format("\\%03d", string.byte(x))
    end)
  )



