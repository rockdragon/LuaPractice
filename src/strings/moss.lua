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

local r_mos = {}
r_mos[".-"]	   =  "a"
r_mos["-..."]  =  "b"
r_mos["-.-."]  =  "c"
r_mos["-.."]   =  "d"
r_mos["."]	   =  "e"
r_mos["..-."]  =  "f"
r_mos["...."]  =  "h"
r_mos[".."]	   =  "i"
r_mos[".---"]  =  "j"
r_mos["-.-"]   =  "k"
r_mos[".-.."]  =  "l"
r_mos["--"]	   =  "m"
r_mos["-."]	   =  "n"
r_mos["---"]   =  "o"
r_mos[".--."]  =  "p"
r_mos["--.-"]  =  "q"
r_mos[".-."]   =  "r"
r_mos["..."]   =  "s"
r_mos["-"]	   =  "t"
r_mos["..-"]   =  "u"
r_mos["...-"]  =  "v"
r_mos[".--"]   =  "w"
r_mos["-..-"]  =  "x"
r_mos["-.--"]  =  "y"
r_mos["--.."]  =  "z"
r_mos[".----"] =  "1"
r_mos["..---"] =  "2"
r_mos["...--"] =  "3"
r_mos["....-"] =  "4"
r_mos["....."] =  "5"
r_mos["-...."] =  "6"
r_mos["--..."] =  "7"
r_mos["---.."] =  "8"
r_mos["----."] =  "9"
r_mos["-----"] =  "0"
r_mos["..--.."]=  "?"
r_mos["-..-."] =  "/"
r_mos["-.--.-"]=  "()"
r_mos["-....-"]=  "-"
r_mos[".-.-.-"]=  "."

--local cache = {}
function trans(s)
  --[[
  if not cache[s] then
    for k, v in pairs(mos) do
      cache[v] = k
      if v == s then break end
    end  
  end
  return cache[s]
  --]]
  return r_mos[s]
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
print(os.clock().."s")
