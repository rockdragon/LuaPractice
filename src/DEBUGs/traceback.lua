Traceback = {}

function Traceback.traceback()
  for level = 1, math.huge do
    local info = debug.getinfo(level, "Sl")
    if not info then break end
    if info.what == "C" then
      print(level, "C function")
    else 
      print(string.format("[%s]:%d", info.short_src,
          info.currentline))
    end
  end
end

return Traceback