def has_path_sum(root, sum)
  return false if root.nil?
  if root.left.nil? && root.right.nil?
    return root.val == sum
  else
    has_path_sum(root.left, sum - root.val) || has_path_sum(root.right, sum - root.val)
  end
end
