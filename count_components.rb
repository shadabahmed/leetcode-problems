def count_components(n, edges)
  return 0 if n.zero?
  edge_map = edges.reduce(Hash.new{|h,k| h[k] = []}){|map, (a, b)| map[a].push(b); map[b].push(a); map}
  set = Set.new(0.upto(n - 1).to_a)
  components = 1
  queue = [0]
  visited = [true]
  while !set.empty?
    node = queue.shift
    set.delete(node)
    edge_map[node].each do |next_node|
      next if visited[next_node]
      visited[next_node] = true
      queue.push(next_node)
    end
    if queue.empty? && !set.empty?
      components += 1
      queue.push(set.first)
    end
  end
  components
end

count_components 5, [[0,1],[1,2],[3,4]]


def traverse()
end


def count_components(n, edges)
  return 0 if n.zero?
  edge_map = edges.reduce(Hash.new{|h,k| h[k] = []}){|map, (a, b)| map[a].push(b); map[b].push(a); map}
  components = 1
  
end
