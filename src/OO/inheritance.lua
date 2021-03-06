Account = { balance = 0 }

function Account:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Account:deposit(v)
  self.balance = self.balance + v
end

function Account:withdraw(v)
  if v > self.balance then error("insufficient funds.") end
  self.balance = self.balance - v 
end

function Account:print()
  print("account funds: " .. self.balance)
end

-- class inherits
local SpecialAccount = Account:new()

function SpecialAccount:withdraw(v) --override & invoking parent.
  Account.withdraw(self, v)
  print("SpecialAccount:withdraw")
end

local s = SpecialAccount:new{limit=1000.00}
s:deposit(1000)
s:withdraw(500)
s:print()
print(s.limit)



