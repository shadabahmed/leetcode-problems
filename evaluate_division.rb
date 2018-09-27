def build_graph(equations, values)
  graph = {}
  equations.each_with_index do |(left, right), idx|
    graph[left] ||= {}
    graph[right] ||= {}
    graph[left][right] = values[idx]
    graph[right][left] = 1.0 / values[idx]
  end
  graph
end

def query(graph, first, second)
  res = -1
  return res unless graph.key?(first)
  queue = [[first, 1.0]]
  visited = {first => true}
  while !queue.empty?
    node, multiplier = queue.shift
    return multiplier if node == second
    graph[node].each do |next_node, next_multiplier|
      next if visited[next_node]
      visited[next_node] = true
      queue.push([next_node, multiplier * next_multiplier])
    end
  end
  res
end


def calc_equation(equations, values, queries)
  graph = build_graph(equations, values)
  res = []
  queries.each do |first, second|
    res << query(graph, first, second)
  end
  res
end

calc_equation [ ["a", "b"], ["b", "c"] ],[2.0, 3.0], [ ["a", "c"], ["b", "a"], ["a", "e"], ["a", "a"], ["x", "x"] ]
