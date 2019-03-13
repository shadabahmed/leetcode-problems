# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root, sum_parent = 0)
  return [] if root.nil?
  convert_bst(root.right, sum_parent)
  if root.right
    root.val = root.val + find_leftmost_val(root.right)
  else
    root.val = root.val + sum_parent 
  end
  convert_bst(root.left, root.val)
  root
end

def find_leftmost_val(root)
  return 0 if root.nil?
  while root.left
    root = root.left
  end
  root.val
end

require './tree'
root = TreeNode.new(2)
root.left = TreeNode.new(0)
root.right = TreeNode.new(3)
root.left.left = TreeNode.new(-4)
root.left.right = TreeNode.new(1)




# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
  return [] if root.nil?
  current, sum = root, 0
  while current
    if current.right
      # find the successor
      suc = current.right
      while suc.left && current != suc.left
        suc = suc.left
      end
      if suc.left == current
        suc.left = nil
        sum += current.val
        current.val = sum
        current = current.left
      else
        suc.left = current
        current = current.right
      end
    else
      sum += current.val
      current.val = sum
      current = current.left
    end
  end
  root
end

# @param {TreeNode} root
# @return {Integer[]}
def convert_bst(root, parent_sum = 0)
  return 0 if root.nil?
  convert_bst(root.right, parent_sum)
  root.val += root.right ? root.right.val : parent_sum
  convert_bst(root.left, root.val)
  root
end

p [root, root.left, root.right, root.left.left, root.left.right].collect(&:val)
convert_bst(root)
p [root, root.left, root.right, root.left.left, root.left.right].collect(&:val)
