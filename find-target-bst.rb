def find_target(root, k, cache = {})
  return false if root.nil?
  return true if cache.key(k - root.val)
  cache[root.val] = true
  find_target(root.left, cache) || find_target(root.right, k, cache)
end
