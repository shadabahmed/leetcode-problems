# https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def count_components(n, edges)
  edge_map = {}
  edges.each do |x, y|
    edge_map[x] ||= []
    edge_map[y] ||= []
    edge_map[x] << y
    edge_map[y] << x
  end
  visited = {}
  count = 0
  0.upto(n - 1) do |node|
    next if visited[node]
    dfs(edge_map, node, visited)
    count += 1
  end
  count
end

def dfs(edge_map, node, visited)
  return if visited[node]
  visited[node] = true
  return unless edge_map.key?(node)
  edge_map[node].each do |next_node|
    dfs(edge_map, next_node, visited)
  end
end

n = 5
edges = [[0, 1], [1, 2], [2, 3], [3, 4]]
edges = [[0, 1], [1, 2], [3, 4]]

p count_components n, edges
