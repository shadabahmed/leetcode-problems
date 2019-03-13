def explore(node, map, visited)
  return false unless map.key?(node)
  map[node].each do  |other_node, _|
    return false if visited.key?(other_node)
    map[other_node].delete(node)
    visited[other_node] = true
    explore(other_node, map, visited)
  end
  true
end

def valid_tree(n, edges)
  return true if n < 2
  edge_map = edges.reduce({}) do |map, (x, y)|
                map[x] ||= {}
                map[y] ||= {}
                map[x][y] = map[y][x] = true
                map
              end
  visited = {0 => true}

  explore(0, edge_map, visited) && visited.length == n
end

p valid_tree 5, [[0,1],[0,2],[0,3],[1,4], [0,4]]
