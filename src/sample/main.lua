
function fwrite(fmt, ...)
  return io.write(string.format(fmt, ...))
end

function writeheader()
  io.write([[
    <html>
      <head><title>Project using lua</title></head>
      <body>
        Here are brief descriptions of some projects around the
        world that use <a href="home.html">Lua</a>.
      </body>
    </html>
    ]])  
end
