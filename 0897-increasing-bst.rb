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
def increasing_bst(root, parent = nil)  
  return parent if root.nil?
  root.right = increasing_bst(root.right, parent)  
  left, root.left = root.left, nil
  increasing_bst(left, root)
end