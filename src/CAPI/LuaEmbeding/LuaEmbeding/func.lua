Func = {}

function Func.add (x, y)
    return x + y
end

Func.x = 1000

function Func.position()
    return 10, 20
end

function Func.printcolor()
    print("[lua std] GREEN table:", GREEN.r, GREEN.g, GREEN.b)
end

return Func