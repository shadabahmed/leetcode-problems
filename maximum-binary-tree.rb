[3,2,1,6,0,5]
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer[]} nums
# @return {TreeNode}

def find_max(nums, left, right)
  max_idx = left
  left.upto(right) do |idx|
    max_idx = idx if nums[max_idx] < nums[idx]
  end
  max_idx
end

def construct_maximum_binary_tree(nums, left = 0, right = nums.length - 1)
  return nil if left > right
  max_idx = find_max(nums, left, right)
  node = TreeNode.new(nums[max_idx])
  node.left = construct_maximum_binary_tree(nums, left, max_idx - 1)
  node.right = construct_maximum_binary_tree(nums, max_idx + 1, right)
  node
end

construct_maximum_binary_tree [3,2,1,6,0,5]
