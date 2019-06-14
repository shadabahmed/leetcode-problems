# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

NEG_INF = -1.0 / 0
# @param {TreeNode} root
# @return {Integer[]}
def largest_values(root)
  levels = []   
  return levels if root.nil?
  queue = [[root, 0]]
  while !queue.empty?
    node, level = queue.shift
    levels[level] ||= NEG_INF
    levels[level] = node.val if node.val > levels[level]
    queue.push([node.left, level + 1]) if node.left
    queue.push([node.right, level + 1]) if node.right
  end
  levels
end