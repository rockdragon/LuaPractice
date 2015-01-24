DebugInfo = {}

function DebugInfo.test()
  print(debug.getinfo(2).what)
end

return DebugInfo