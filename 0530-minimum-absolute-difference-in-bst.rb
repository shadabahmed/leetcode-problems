# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference(root, stack = [NEG_INF])
  return INF if root.nil?
  left_min_diff = get_minimum_difference(root.left, stack)
  current_diff = root.val - stack.last
  stack.push(root.val)
  right_diff = get_minimum_difference(root.right, stack)
  [left_min, current_diff, right_diff].min
end