linkedlist = {}

function linkedlist.new()
  return { first = 0, last = -1 }
end

function linkedlist.pushfirst(list, value)
  local first = list.first - 1
  list.first = first
  list[first] = value
end

function linkedlist.pushlast(list, value)
  local last = list.last + 1
  list.last = last
  list[last] = value
end

function linkedlist.popfirst(list)
  local first = list.first
  if first > list.last then error("list is empty.") end
  local value = list[first]
  list[first] = nil
  list.first = first + 1
  return value
end

function linkedlist.poplast(list)
  local last = list.last
  if last < list.first then error("list is empty.") end
  local value = list[last]
  list[last] = nil
  list.last = last - 1
  return value
end

return linkedlist