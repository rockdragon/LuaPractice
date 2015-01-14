--阶乘
function fact (n)
  if n == 0 then
    return 1
  else
    return n * fact(n-1)
  end
end

--尾递归阶乘
function factWithTail(n, m)
  if n == 0 then
    return m
  else 
    return factWithTail(n-1, n*m)
  end
end

--[[
  测试
]]
print("5!=", factWithTail(5, 1))