def lowest_common_ancestor(root, p, q, parent = nil)
  return nil if root.nil?
  return parent if p == q && q == root
  return root if root.val > p.val != root.val > q.val
  lowest_common_ancestor(root.val > p.val ? root.left : root.right, p, q, root)
end
