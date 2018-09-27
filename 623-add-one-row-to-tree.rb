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
# @param {Integer} d
# @return {TreeNode}
def add_one_row(root, v, d, current_depth = 1)
  return nil if root.nil?
  if d == 1
    node =  TreeNode.new(v)
    node.left = root
    root = node
  elsif d == current_depth + 1
    left = TreeNode.new(v)
    left.left = root.left
    root.left = left
    right = TreeNode.new(v)
    right.right = root.right
    root.right = right
  else
    root.left = add_one_row(root.left, v, d, current_depth + 1)
    root.right = add_one_row(root.right, v, d, current_depth + 1)
  end
  root
end

root = TreeNode.new(1)
root.left = TreeNode.new 2
root.left.right = TreeNode.new 4
root.right = TreeNode.new 3

p add_one_row(root, 10, 2)