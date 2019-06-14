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
def bst_to_gst(root, parent_sum = 0)
  return nil if root.nil?
  if root.right
    bst_to_gst(root.right, parent_sum)
    root.val += smallest(root.right)
  else
    root.val += parent_sum
  end
  bst_to_gst(root.left, root.val)
  root
end

def smallest(root)
  return 0 if root.nil?
  while root.left
    root = root.left
  end
  root.val
end