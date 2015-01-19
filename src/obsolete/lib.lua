module = {}

--阶乘
function module.fact (n)
  if n == 0 then
    return 1
  else
    return n * module.fact(n-1)
  end
end

--尾递归阶乘
function module.factWithTail(n, m)
  if n == 0 then
    return m
  else 
    return module.factWithTail(n-1, n*m)
  end
end

return module