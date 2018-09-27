# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
def create_edge_map(num_courses, prerequisites)
  edge_map = {}
  0.upto(num_courses - 1) { |course| edge_map[course] = {} }
  prerequisites.each do |course, pre_req|
    edge_map[course][pre_req] = true
  end
  edge_map
end

def find_order(num_courses, prerequisites)
  edge_map = create_edge_map(num_courses, prerequisites)
  res = []
  while !edge_map.empty?
    zero_inorder_node = edge_map.keys.find { |k| edge_map[k].empty? }
    return [] if zero_inorder_node.nil?
    res << zero_inorder_node
    edge_map.delete(zero_inorder_node)
    edge_map.each do |_, v|
      v.delete(zero_inorder_node)
    end
  end
  res
end

p find_order 4, [[1, 0], [2, 0], [3, 1], [3, 2]]
