# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer}
def sum_of_left_leaves(root)
  return 0 if root.nil?
  queue, sum = [[false, root]], 0
  while !queue.empty?
    left_leaf, node = queue.shift
    sum += node.val if node.left.nil? && node.right.nil? && left_leaf
    queue.push([true, node.left]) if node.left
    queue.push([false, node.right]) if node.right
  end
  sum
end

root = TreeNode.new(1)
root.left = TreeNode.new(7)
root.right = TreeNode.new(10)
root.right.left = TreeNode.new(12)

p sum_of_left_leaves root