# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder, p_first = 0, p_last = preorder.length - 1, i_first = 0, i_last = inorder.length - 1)
  return if p_first > p_last || i_first > i_last
  root = TreeNode.new(preorder[p_first])
  mid = i_first.upto(i_last).find { |idx| inorder[idx] == preorder[p_first] }
  root.left = build_tree(preorder, inorder, p_first + 1, p_first + mid - i_first, i_first, mid - 1)
  root.right = build_tree(preorder, inorder, p_first + mid - i_first + 1, p_last, mid + 1, i_last)
  root
end

p build_tree [2, 1, 3], [1, 2, 3]
