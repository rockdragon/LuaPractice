local co = coroutine.create(function()
    local x = 10
    coroutine.yield(x)
    error("some error.")
  end)

print(coroutine.resume(co))
print(debug.traceback(co))
print(coroutine.resume(co))

print(debug.getlocal(co, 1, 1))