def is_valid_bst(root, min = nil, max = nil)
  return true if root.nil?
  (min.nil? || root.val > min.val) &&
  (max.nil? || root.val < max.val) &&
  is_valid_bst(root.left, min, root) &&
  is_valid_bst(root.right, root, max)
end
