# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Float[]}
def average_of_levels(root)
  average_of_levels_helper(root).collect{|sum, count| sum.to_f / count}
end

def average_of_levels_helper(root, level = 0, avgs = [])
  return avgs if root.nil?
  sum, count = avgs[level] ? avgs[level] : [0, 0]
  avgs[level] = [sum + root.val, count + 1]
  average_of_levels_helper(root.left, level + 1, avgs)
  average_of_levels_helper(root.right, level + 1, avgs)
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)

p average_of_levels root