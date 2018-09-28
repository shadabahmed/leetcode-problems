# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def prune_tree(root)
  return nil if root.nil?
  root.left = prune_tree(root.left)
  root.right = prune_tree(root.right)
  return nil if root.val.zero? && root.left.nil? && root.right.nil?
  root
end

