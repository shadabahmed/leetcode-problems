# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root, other_root = root)
  return true if root.nil? && other_root.nil?
  return false if root.nil? || other_root.nil?
  root.val == other_root.val &&  
  is_symmetric(root.left, other_root.right) &&
  is_symmetric(other_root.left, root.right) &&
end
