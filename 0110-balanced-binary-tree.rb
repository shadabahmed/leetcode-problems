# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  max_depth(root) >= 0
end

def max_depth(root)
  return 0 if root.nil?
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)
  if left_depth.negative? || right_depth.negative? || (left_depth - right_depth).abs > 1
    -1
  else
    1 + [left_depth, right_depth].max
  end
end

root = TreeNode.new(4)
root.left = TreeNode.new(2)
root.right = TreeNode.new(5)
root.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(3)
p is_balanced(root)
