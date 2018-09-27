def right_side_view(root)
  res = []
  return res if root.nil?
  queue = [root]
  while !queue.empty?
    res.push(queue.last.val)
    queue.size.times do
      first = queue.shift
      queue.push(first.left) if first.left
      queue.push(first.right) if first.right
    end
  end
  res
end
