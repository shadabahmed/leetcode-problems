require "set"

def dfs(node, finished, edge_map)
  edge_map[node].each do |pre_req|
    dfs(pre_req)
  end
  edge_map.delete(node)
  true
end

def can_finish(num_courses, pre_req)
  edge_map = pre_req.reduce(Hash.new({}) { |h, k| h[k] = [] }) { |h, c, p| h[c].push(p); h }
  while !edge_map.empty?
    node = edge_map.keys.first
    queue = [node]
    visited[node] = true
    while !queue.empty?
      node = queue.shift
      neighbours = edge_map.delete(node)
      neighbours.each do |neighbour|
        return false if visited[neighbour]
        queue.push(neighbour)
      end
    end
  end
  true
end

def dfs(course, map, visited)
  return true unless map.key?(course)
  visited.add(course)
  map[course].each do |pre_req|
    return false if visited.include?(pre_req) || !dfs(pre_req, map, visited)
  end
  map.delete(course)
  visited.delete(course)
  true
end

def can_finish(num_courses, pre_req)
  map = 0.upto(num_courses - 1).collect { |course| [course, Set.new()] }.to_h
  pre_req.each do |course, pre_req|
    map[course] << pre_req
  end
  visited = Set.new()
  0.upto(num_courses - 1).all? do |course|
    dfs(course, map, visited)
  end
end

p can_finish(2, [[1, 0]])
p can_finish(2, [[1, 0], [0, 1]])
