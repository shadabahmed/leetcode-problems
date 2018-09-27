#Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer} n
# @return {TreeNode[]}
def all_possible_fbt(n)
  res = []
  return res if n.zero? || n % 2 == 0
  return res.push(TreeNode.new(0)) if n == 1
  1.step((n - 1) / 2, 2) do |num|
    left = all_possible_fbt(num)
    right = all_possible_fbt(n - 1 - num)
    left.each do |s_left|
      right.each do |s_right|
        root = TreeNode.new(0)
        root.left = s_left
        root.right = s_right
        res << root
        next if num == n - 1 - num
        root = TreeNode.new(0)
        root.left = s_right
        root.right = s_left
        res << root
      end
    end
  end
  res
end

p all_possible_fbt(5).size
