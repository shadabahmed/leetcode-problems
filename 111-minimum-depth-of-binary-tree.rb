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
def min_depth(root)
  return 0 if root.nil?
  if root.left && root.right
    1 + [min_depth(root.left), min_depth(root.right)].min
  elsif root.left
    1 + min_depth(root.left)
  else
    1 + min_depth(root.right)
  end  
end

require './tree'

p min_depth(Tree.create([1,2,3,4,5]))