util = {}

function util.iter(a)
  for k, v in pairs(a) do
    print(k, v)
  end
end

return util