# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root, level = depth(root) - 1, res = [])
  return res if root.nil?
  res[level] ||= []
  res[level] << root.val
  level_order_bottom(root.left, level - 1, res)
  level_order_bottom(root.right, level - 1, res)
end

def depth(root)
  return 0 if root.nil?
  1 + [depth(root.left), depth(root.right)].max
end

def level_order_bottom(root, level = -1, res = [])
  return res if root.nil?
  res.unshift([]) if level * -1 > res.size
  res[level] << root.val
  level_order_bottom(root.left, level - 1, res)
  level_order_bottom(root.right, level - 1, res)
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)

p level_order_bottom root