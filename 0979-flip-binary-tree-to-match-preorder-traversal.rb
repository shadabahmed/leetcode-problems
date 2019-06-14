# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer[]} voyage
# @return {Integer[]}
def flip_match_voyage(root, voyage, idx = 0, count_map = {}, res = [])
  count_map = create_count_map(root)
  flip_match_voyage(root, voyage, 0, count_map, res)
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer[]} voyage
# @return {Integer[]}
def flip_match_voyage(root, voyage, res = [])
   return res if root.nil?
   expected_val = voyage.shift
   if expected_val != root.val
    res.clear
    res << -1
    return res
   end
   return res if voyage.empty?
   if root.left.val != voyage.first
    root.left, root.right = root.right, root.left    
    res << 1
   end
   flip_match_voyage(root.left, voyage, res) unless res.first == -1
   flip_match_voyage(root.right, voyage, res) unless res.first == -1
   res
end
