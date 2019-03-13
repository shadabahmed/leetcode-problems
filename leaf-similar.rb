def leaves(root, res = [])
  return res if root.nil?
  return res.push(root.val) if root.left.nil? && root.right.nil?
  leaves(root.left, res)
  leaves(root.right, res)
  res
end

def leaf_similar(root1, root2)
  leaves(root1) == leaves(root2)
end

#Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

root1 = TreeNode.new(1)
root1.left = TreeNode.new(2)
root1.right = TreeNode.new(3)

root2 = TreeNode.new(1)
root2.left = TreeNode.new(4)
root2.left.right = TreeNode.new(2)
root2.right = TreeNode.new(5)
root2.right.left = TreeNode.new(3)
p leaf_similar(root1, root2)
