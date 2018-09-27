# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}

class TreeNode < Struct.new(:val, :left, :right); end

root = TreeNode.new(5)
root.left = TreeNode.new(1)
root.left.left = TreeNode.new(5)
root.left.right = TreeNode.new(5)
root.right = TreeNode.new(5)
#root.right.left = Node.new(5)
root.right.right = TreeNode.new(5)

def count_unival_subtrees_helper(root)
  return [true, 0] if root.nil?
  left_unival, left_unival_count = count_unival_subtrees_helper(root.left)
  right_unival, right_unival_count = count_unival_subtrees_helper(root.right)
  unival_at_root = left_unival && right_unival &&
                    (root.left.nil? || root.left.val == root.val) &&
                    (root.right.nil? || root.right.val == root.val)
  count = left_unival_count + right_unival_count + (unival_at_root ? 1 : 0)
  [unival_at_root, count]
end

def count_unival_subtrees(root)
  count_unival_subtrees_helper(root)[1]
end

count_unival_subtrees root.left
