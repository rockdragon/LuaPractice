-- encoding to hex
function encode(s)
  return string.gsub(s, "([\128-\255=])", function(c)
      return string.format("=%02X", string.byte(c))
  end)
end

--decoding from hex
function decode(s)
  return string.gsub(s, "=(%x%x)", function(c)      
      return string.char(tonumber(c, 16))
    end)
end

print("please input:")
local t = io.read()
t = encode(t)
print(t)

print("recover:")
print(decode(t))
