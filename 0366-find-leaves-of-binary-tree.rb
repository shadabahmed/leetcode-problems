# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def find_leaves(root, res)
  res = []
  while !root.nil?
    res << []
    root = peel_layer(root, res.last)
  end
  res
end

def peel_layer(root, res)
  return nil if root.nil?
  if root.left.nil? && root.right.nil?
    res.push(root.val)
    return nil  
  end
  root.left = peel_layer(root.left, res)
  root.right = peel_layer(root.right, res)
  root
end


# @param {TreeNode} root
# @return {Integer[][]}
def find_leaves(root, res)
  res = []
  dfs(root, res)
  res
end

def dfs(root, res)
  return -1 if root.nil?
  step = [dfs(root.right), dfs(root.left)].max + 1
  res[step] ||= []
  res[step] << root.val
  step
end 