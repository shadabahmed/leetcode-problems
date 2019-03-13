# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @param {TreeNode} target
# @param {Integer} k
# @return {Integer[]}

# def distance_k_h(root, target, k, dist = nil, res)
#   return if root.nil?
#   target_in_left, target_in_right = false, false
#   dist = 0 if root == target
#   if dist.nil?
#     left_dist = distance_k_h(root.left, target, k, dist, res)
#     if left_dist()
#   else
#   end
#   if root == target
#     dist = 0
#   elsif dist.nil?
#     left_dist = distance_k_h(root.left, target, k, dist, res)
#     if left_dist
#       target_in_left = true
#       dist = left_dist
#     else
#       target_in_right = true
#       dist = distance_k_h(root.right, target, k, dist, res)
#     end
#   end
#   if target_in_right
#     distance_k_h(root.left, target, k, dist + 1, res)
#   elsif target_in_right    
#     distance_k_h(root.right, target, k, dist + 1, res)
#   else
#     distance_k_h(root.left, target, k, dist + 1, res)
#     distance_k_h(root.right, target, k, dist + 1, res)
#   end
#   res.push(root.val) if dist == k
#   return dist + 1  
# end

def distance_k_h(root, target, k, dist, res)
  return -1 if root.nil? || dist > k
  dist = 0 if root == target
  if dist >= 0
    distance_k_h(root.left, target, k, dist + 1, res)
    distance_k_h(root.right, target, k, dist + 1, res)
  elsif (left_dist = distance_k_h(root.left, target, k, dist, res)) > 0
    dist = left_dist
    distance_k_h(root.right, target, k, dist + 1, res)
  elsif (right_dist = distance_k_h(root.right, target, k, dist, res)) > 0
    dist = right_dist
    distance_k_h(root.left, target, k, dist + 1, res) 
  end
  res.push(root.val) if dist == k  
  dist < 0 ? -1 : dist + 1
end

def distance_k(root, target, k)
  res = []
  distance_k_h(root, target, k, -1, res)
  res   
end

root = TreeNode.new(0)
#root.left = TreeNode.new(1)
root.right = TreeNode.new(1)
#root.left.right = TreeNode.new(2)
root.right.left = TreeNode.new(3)
root.right.right = TreeNode.new(2)

p distance_k(root, root.right.right, 1)
