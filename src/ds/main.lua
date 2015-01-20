local mt = {}

function init(mt, N)
  for i = 1, N do
    mt[i] = {}
    for j =1 ,i do
      mt[i][j] = 0
    end
  end
end

function iter(mt, N)
  for i = 1, N do
    for j =1 ,i do
      io.write(mt[i][j])
    end
    io.write("\n")
  end
end

init(mt, 10)
iter(mt, 10)
