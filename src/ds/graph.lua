graph = {}

graph.__graph = {}

function graph.name2node(graph, name)
  if not graph.__graph[name] then
    graph.__graph[name] = {name = name, adj = {}}
  end
  return graph.__graph[name]
end

return graph