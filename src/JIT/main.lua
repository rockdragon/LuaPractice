local ffi = require("ffi")
ffi.cdef[[
void Sleep(int ms);
int poll(struct pollfd *fds, unsigned long nfds, int timeout);
int printf(const char  *fmt, ...);
]]
ffi.C.printf("hell luajit!\n")

local sleep
if ffi.os == "Windows" then
  function sleep(s)
    ffi.C.Sleep(s*1000)
  end
else
  function sleep(s)
    ffi.C.poll(nil, 0, s*1000)
  end
end

for i=1, 100 do
  sleep(0.1)
  ffi.C.printf("\07")
end
