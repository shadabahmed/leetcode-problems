# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder, in_start = 0, in_end = inorder.length - 1, post_start = 0, post_end = postorder.length - 1)
  return nil if post_start > post_end || in_start > in_end
  root = TreeNode.new(postorder[post_end])
  root_inorder_idx = get_index(inorder, in_start, in_end, postorder[post_end])
  right_len = in_end - root_inorder_idx
  left_len = root_inorder_idx - in_start
  root.left = build_tree(inorder, postorder, in_start, root_inorder_idx - 1, post_start, post_start + left_len - 1)
  root.right = build_tree(inorder, postorder, root_inorder_idx + 1, in_end, post_end - right_len, post_end - 1)  
  root
end

def get_index(arr, first, last, target)
  first.upto(last) do |idx|
    return idx if arr[idx] == target
  end
end

inorder = [9, 3, 15, 20, 7]
postorder = [9, 15, 7, 20, 3]

# inorder = [1,2,3]
# postorder = [1,3,2]
p build_tree inorder, postorder
