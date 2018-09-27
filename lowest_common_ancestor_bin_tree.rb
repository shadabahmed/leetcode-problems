def exists?(root, p)
  return false if root.nil?
  if root == p
    true
  else
    exists?(root.left, p) || exists?(root.right, p)
  end
end


def lowest_common_ancestor(root, p, q)
  return nil if root.nil?
  return root if root == p || root == q
  left = lowest_common_ancestor(root.left, p, q)
  right = lowest_common_ancestor(root.right, p, q)
  if left && right
    left
  else
    left ? left : right
  end
end

def path(root, node, stack = [])
  return nil if root.nil?
  stack.push(root)
  if root == node || path(root.right, node, stack) || path(root.left, node, stack)
    stack
  else
    stack.pop
    nil
  end
end


def lowest_common_ancestor(root, p, q)
  return nil if root.nil?
  path_to_p = path(root, p)
  path_to_q = path(root, q)
  diff_in_length = path_to_p.length - path_to_q.length
  if diff_in_length > 0
    diff_in_length.times { path_to_p.pop }
  elsif diff_in_length < 0
    (-1 * diff_in_length).times { path_to_q.pop }
  end

  while path_to_p.last != path_to_q.last
    path_to_p.pop
    path_to_q.pop
  end
  path_to_p.last
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

root = TreeNode.new(1)
root.right = TreeNode.new(4)
root.left = TreeNode.new(2)
root.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(3)

p path(root, root.left.right).collect(&:val)
lowest_common_ancestor(root, root.left.left, root.left.right)
