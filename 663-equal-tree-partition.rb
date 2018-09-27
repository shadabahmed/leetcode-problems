# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def check_equal_tree(root, parent_sum = 0)
  return false if root.nil?
  sum_set = Set.new
  cur_sum = sum(root.left, sum_set) + sum(root.right, sum_set) + root.val  
  cur_sum % 2 == 0 && sum_set.include?(cur_sum / 2)  
end

def sum(root, sum_set)
  return 0 if root.nil?
  cur_sum = root.val + sum(root.left, sum_set) + sum(root.right, sum_set)
  sum_set.add(cur_sum)
  cur_sum
end

root = TreeNode.new(0)
root.left = TreeNode.new -1
root.right = TreeNode.new 1

p check_equal_tree root