require './tree'

# @param {TreeNode} root
# @return {Integer}
def rob_h(root)
  return [0,0] if root.nil?
  with_left, without_left = rob_h(root.left)
  with_right, without_right = rob_h(root.right)
  [without_left + without_right + root.val, [with_left + with_right, without_left + with_right, with_left + without_right].max]
end

def rob(root)
  rob_h(root).max
end
