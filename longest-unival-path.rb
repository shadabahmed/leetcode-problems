# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

root = TreeNode.new(2)
left = root.left = TreeNode.new(2)
right = root.right = TreeNode.new(2)
5.times do
  left.left = TreeNode.new(1)
  left = left.left
end

5.times do
  right.right = TreeNode.new(1)
  right = right.right
end

def unival_at_root(root, parent = nil)
  return 0 if root.nil?
  if parent.nil?
    unival_at_root(root.left, root) + unival_at_root(root.right, root)
  elsif parent.val == root.val
    1 + [unival_at_root(root.left, parent), unival_at_root(root.right, parent)].max
  else
    0
  end
end

def longest_univalue_path(root)
  return 0 if root.nil?
  [longest_univalue_path(root.left), longest_univalue_path(root.right), unival_at_root(root)].max
end
p root
longest_univalue_path root

class Solution
  class << self
    attr_accessor :longest_path
    def longest_univalue_path(root)
      self.longest_path = 0
      longest_univalue_path_helper(root)
      longest_path
    end

    def longest_univalue_path_helper(root)
      return 0 if root.nil?
      left_path = longest_univalue_path_helper(root.left)
      right_path = longest_univalue_path_helper(root.right)
      cur_left_path, cur_right_path = 0, 0
      if root.left && root.left.val == root.val
        cur_left_path = left_path + 1
      end
      if root.right && root.right.val == root.val
        cur_right_path = right_path + 1
      end
      self.longest_path = [longest_path, cur_left_path + cur_right_path].max
      [cur_left_path, cur_right_path].max
    end
  end
end
Solution.longest_univalue_path root
