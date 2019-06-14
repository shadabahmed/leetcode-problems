# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {String}
def smallest_from_leaf(root)
  paths = dfs(root)
  min_path = paths[0]
  1.upto(paths.length - 1) do |idx|
    min_path = get_smallest(min_path, paths[idx])
  end
  min_path
end

def dfs(root, stack = [], res = [])
  return res if root.nil?
  stack.unshift((97 + root.val).chr)
  if root.left.nil? && root.right.nil?
    res << stack.join
  else
    dfs(root.left, stack, res) if root.left
    dfs(root.right, stack, res) if root.right
  end
  stack.shift
  res
end

def get_smallest(s1, s2)
  idx1, idx2 = 0, 0
  while idx1 < s1.length && idx2 < s2.length
    return s1 if s1[idx1].ord < s2[idx2].ord
    return s2 if s1[idx1].ord > s2[idx2].ord
    idx1 += 1
    idx2 += 1
  end
  s1.length > s2.length ? s2 : s1
end

root = TreeNode.new(0)
root.left = TreeNode.new(1)
root.left.left = TreeNode.new(3)
root.left.right = TreeNode.new(4)
root.right = TreeNode.new(2)
root.right.left = TreeNode.new(3)
root.right.right = TreeNode.new(4)


root = TreeNode.new(25)
root.left = TreeNode.new(1)
root.left.left = TreeNode.new(3)
root.left.right = TreeNode.new(1)
root.right = TreeNode.new(3)
root.right.left = TreeNode.new(0)
root.right.right = TreeNode.new(2)



#[25,1,null,0,0,1,null,null,null,0]
root = TreeNode.new(25)
root.left = TreeNode.new(1)
root.left.left = TreeNode.new(0)
root.left.right = TreeNode.new(0)
root.left.left.left = TreeNode.new(1)
root.left.left.left.left = TreeNode.new(0)


# root = TreeNode.new(2)
# root.left = TreeNode.new(2)
# root.right = TreeNode.new(1)
# root.right.left = TreeNode.new(0)
# root.left.right = TreeNode.new(0)
# root.left.right = TreeNode.new(1)
# root.left.right.left = TreeNode.new(0)

p smallest_from_leaf root