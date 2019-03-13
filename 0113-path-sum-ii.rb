# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum, current_sum = 0, path = [], res = [])
  return res if root.nil?
  current_sum += root.val
  path.push(root.val)
  if root.left.nil? && root.right.nil?
    res.push(path.clone) if sum == current_sum
  else
    path_sum(root.left, sum, current_sum, path, res)
    path_sum(root.right, sum, current_sum, path, res)
  end  
  path.pop
  res
end