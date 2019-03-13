def binary_tree_paths(root, path = [], res = [])
  return res if root.nil?
  path.push(root.val)
  if root.left.nil? && root.right.nil?
    res.push(path.join('->'))
  else
    binary_tree_paths(root.left, path, res)
    binary_tree_paths(root.right, path, res)
  end
  path.pop
  res
end
