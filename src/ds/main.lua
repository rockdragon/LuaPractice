
function iter(a)
  for k, v in pairs(a) do
    print(k, v)
  end
end

local a = {1 , 2, 103.4, 6, 9}
a.first = 3
a.first = a.first - 1
print(a[a.first])