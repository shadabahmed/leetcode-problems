def preorder_traversal(root)
  stack, res = [[root, false]], []
  while !stack.empty?
    node, processed = stack.pop
    if processed
      res.push(node.val)
    else
      stack.push([node.right, false]) if node.right
      stack.push([node.left, false]) if node.left
      stack.push([node, true]) if node.left
    end
  end
  res
end


def preorder_traversal(root)
  return [] if root.nil?
  stack, queue, res = [root], [], []
  while !stack.empty? || !queue.empty?
    if !stack.empty?
      node = stack.pop
      queue.push(node)
      while node.left
        queue.push(node.left)
        node = node.left
      end
    end
    if !queue.empty?
       node = queue.shift
       res.push(node.val)
       queue.push(node.right) if node.right
    end
  end
  res
end


def preorder_traversal(root)
  return [] if root.nil?
  stack = [root]
  while !stack.empty?
    node = stack.pop
    res.push(node.val)
    stack.push(node.right) if node.right
    stack.push(node.left) if node.left
  end
  res
end
