# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Integer} v
# @return {TreeNode[]}
def split_bst(root, v)
  lesser, greater = nil, nil
  return [lesser, greater] if root.nil?
  if root.val > v
    lesser, greater = split_bst(root.left, v)
    root.left = greater
    greater = root
  else
    lesser, greater = split_bst(root.right, v)
    root.right = lesser
    lesser = root
  end
  [lesser, greater]
end

root = TreeNode.new 4
root.left = TreeNode.new 2
root.right = TreeNode.new 6
root.left.left = TreeNode.new 1
root.left.right = TreeNode.new 3
root.right.left = TreeNode.new 5
root.right.right = TreeNode.new 7
p split_bst root, 2.5
