# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {TreeNode}
def trim_bst(root, l, r)
  return root if root.nil?
  if root.val < l
    trim_bst(root.right, l, r)
  elsif root.val > r
    trim_bst(root.left, l, r)
  else
    root.left = trim_bst(root.left, l, root.val)
    root.right = trim_bst(root.right, root.val, r)
    root
  end    
end

root = TreeNode.new(1)
root.left = TreeNode.new(0)
root.right = TreeNode.new(2)

p trim_bst root, 1, 2