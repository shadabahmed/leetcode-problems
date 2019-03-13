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
def max_path_sum(root)
  return 0 if root.nil?
  left_max_sum = max_path_sum(root.left)
  righ_max_sum = max_path_sum(root.right)
  left_path_sum = [max_path_including(root.left), 0].max
  right_path_sum = [max_path_including(root.right), 0].max
  current_max_sum = left_path_sum + right_path_sum + root.val
  if root.left && root.right
    [current_max_sum, left_max_sum, righ_max_sum].max
  elsif root.right
    [current_max_sum, righ_max_sum].max
  elsif root.left
    [current_max_sum, left_max_sum].max
  else
    current_max_sum
  end
end

def max_path_including(root)
  return 0 if root.nil?
  left_max_sum = root.val + max_path_including(root.left)
  right_max_sum = root.val + max_path_including(root.right)
  [left_max_sum, right_max_sum].max
end

root = TreeNode.new(-10)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)
p max_path_sum root