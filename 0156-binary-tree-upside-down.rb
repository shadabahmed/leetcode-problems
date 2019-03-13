#Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {TreeNode}
def upside_down_binary_tree(root)  
  return nil if root.nil?
  root.left = upside_down_binary_tree(root.left)
  root.right = upside_down_binary_tree(root.right)
  left = root.left
  right = root.right
  root.left = nil
  root.right = nil
  attach(left, right, root)
end

def attach(node, left, right)
  if node.nil?
    right.left = left  
    node = right
  elsif node.left.nil? && node.right.nil?
    node.left = left
    node.right = right
  else
    node.right = attach(node.right, left, right)
  end
  node
end

def leaf?(root)
  root.nil? || (root.left.nil? && root.right.nil?)
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
# root.right = TreeNode.new(3)
root.left.left = TreeNode.new(3)
# root.left.right = TreeNode.new(5)

#p upside_down_binary_tree(root.left)
p upside_down_binary_tree(root)
