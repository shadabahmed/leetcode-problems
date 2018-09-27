def level_order(root)
  res = []
  return res if root.nil?
  queue = [root]
  while !queue.empty?
    level = []
    queue.size.times do
      node = queue.shift
      level.push(node.val)
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    res.push(level)
  end
  res
end
