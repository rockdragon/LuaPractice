local WeighingRand = require("maths.WeighingRand")

local rand = WeighingRand.new({
      ["A"] = 5,
      ["B"] = 10,
      ["C"] = 15,
      ["D"] = 20,
      ["E"] = 50
})

for i=1, 10 do
  print(rand())
end

