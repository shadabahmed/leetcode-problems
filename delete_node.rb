class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def delete_node(root, key)
  return if root.nil?
  if key == root.val
    replacement = nil
    if root.right
      root.right, replacement = delete_smallest(root.right)
    else
      root.left, replacement = delete_largest(root.left)
    end
    if replacement
      replacement.left = root.left
      replacement.right = root.right
    end
    root = replacement
  elsif key > root.val
    root.right = delete_node(root.right, key)
  else
    root.left = delete_node(root.left, key)
  end
  root
end

def delete_largest(root)
  return [nil, nil] if root.nil?
  if root.right
    subtree, largest = delete_largest(root.right)
    root.right = subtree
    [root, largest]
  else
    left_subtree = root.left
    root.left = nil
    [left_subtree, root]
  end
end

def delete_smallest(root)
  return [nil, nil] if root.nil?
  if root.left
    subtree, smallest = delete_smallest(root.left)
    root.left = subtree
    [root, smallest]
  else
    right_subtree = root.right
    root.right = nil
    [right_subtree, root]
  end
end

root = TreeNode.new(5)
root.left = TreeNode.new(3)
root.left.left = TreeNode.new(2)
root.left.right = TreeNode.new(4)
root.left.right.right = TreeNode.new(4.5)
root.right = TreeNode.new(6)
root.right.right = TreeNode.new(7)
p root
p delete_node(root, 3)
