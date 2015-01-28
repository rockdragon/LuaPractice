local mos = {}
mos["a"] = ".-"
mos["b"] = "-..."
mos["c"] = "-.-."
mos["d"] = "-.."
mos["e"] = "."
mos["f"] = "..-."
mos["h"] = "...."
mos["i"] = ".."
mos["j"] = ".---"
mos["k"] = "-.-"
mos["l"] = ".-.."
mos["m"] = "--"
mos["n"] = "-."
mos["o"] = "---"
mos["p"] = ".--."
mos["q"] = "--.-"
mos["r"] = ".-."
mos["s"] = "..."
mos["t"] = "-"
mos["u"] = "..-"
mos["v"] = "...-"
mos["w"] = ".--"
mos["x"] = "-..-"
mos["y"] = "-.--"
mos["z"] = "--.."

mos["1"] = ".----"
mos["2"] = "..---"
mos["3"] = "...--"
mos["4"] = "....-"
mos["5"] = "....."
mos["6"] = "-...."
mos["7"] = "--..."
mos["8"] = "---.."
mos["9"] = "----."
mos["0"] = "-----"
mos["?"] = "..--.."
mos["/"] = "-..-."
mos["()"] = "-.--.-"
mos["-"] = "-....-"
mos["."] = ".-.-.-"

local cache = {}
function trans(s)
  if not cache[s] then
    for k, v in pairs(mos) do
      cache[v] = k
      if v == s then break end
    end  
  end
  return cache[s]
end

local m = {".--.", ".-", "-.", ".-.-.-", "-...", ".-", "..",
     "-..", "..-", ".-.-.-", "-.-.","---","--","-..-.",
     "...", "-..-.", ".----","....","--.-","...-","M",
     "-", "....","E"}
   
for _, v in pairs(m) do
  local t = trans(v)
  io.write((t and {t} or {v})[1])
end
io.write("\n")
