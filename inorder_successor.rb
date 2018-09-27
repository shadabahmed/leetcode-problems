def left_most(node)
  while node && node.left
    node = node.left
  end
  node
end

def inorder_successor(root, p, successor = nil)
  return if root.nil?
  return left_most(root.right) || successor if root == p
  inorder_successor(root.left, p, root) ||
  inorder_successor(root.right, p, successor)
end
