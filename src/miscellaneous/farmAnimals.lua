--[[
  有一个农场，鸡的数目是鸭的四倍，但是鸭又比猪少九只，鸭和猪的数目是六十七只，请问农场所有动物的脚加起来共多少只？
--]]

local chicken, duck, hog

function duckNumber(total, hogs)
  local ducks = 1
  while true do
      if ducks + ducks + hogs == total then break end
      ducks = ducks + 1
  end
  return ducks, total - ducks
end

duck, hog = duckNumber(67, 9)
chicken = 4 * duck

print("duck:" .. duck, "chicken:" .. chicken, "hog:"..hog)
print(duck*2 + chicken *2 + hog *4)

