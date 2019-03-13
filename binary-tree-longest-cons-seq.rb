#Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def longest_consecutive_and_max(root)
  return [0, 0] if root.nil?
  len_current = 1
  len_at_left, max_left = longest_consecutive_and_max(root.left)
  len_at_right, max_right = longest_consecutive_and_max(root.right)
  #binding.pry
  if len_at_left > 0 && root.left.val == root.val + 1
    len_current = 1 + len_at_left
  end

  if len_at_right > 0 && root.right.val == root.val + 1 && len_current < 1 + len_at_right
    len_current = 1 + len_at_right
  end

  max_current = [max_left, max_right, len_current].max
  [len_current, max_current]
end


def longest_consecutive(root, length = 1)
  return length - 1 if root.nil?
  left_max = longest_consecutive(root.left, (root.left.nil? || root.left.val == root.val + 1) ? length + 1 : 1)
  right_max = longest_consecutive(root.right, (root.right.nil? || root.right.val == root.val + 1) ? length + 1 : 1)
  [length, right_max, left_max].max
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.left = TreeNode.new(4)
root.left.right = TreeNode.new(5)
root.right.left = TreeNode.new(4)

longest_consecutive(root)
