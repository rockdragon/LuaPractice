Lib = {}


function Lib.test()
  return debug.getinfo(2)
end

function Lib.print()
  local debugInfo = Lib.test()
  print("what", debugInfo.what)
  print("name", debugInfo.name)
  print("namewhat", debugInfo.namewhat)
  print("func", debugInfo.func)
  print("source", debugInfo.source)
  print("short_src", debugInfo.short_src)
  print("linedefined", debugInfo.linedefined)
  print("lastlinedefined", debugInfo.lastlinedefined)
  print("currentline", debugInfo.currentline) 
  if debugInfo.activelines ~= nil then
    for k, v in pairs(debugInfo.activelines) do
      print(k, v)
    end
  end
end

return Lib