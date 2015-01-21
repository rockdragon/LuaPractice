local authors = {}
function Entry (b) authors[b.author] = true end
dofile("storage\\data")
for name in pairs(authors) do print(name) end
