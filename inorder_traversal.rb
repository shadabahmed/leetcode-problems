def inorder_traversal(root)
  res = []
  return res if root.nil?
  stack = [[root, false]]
  while !stack.empty?
    node, processed = stack.pop
    if !processed
      stack.push([node.right, false]) if node.right
      stack.push([node, true])
      stack.push([node.left, false]) if node.left
    else
      res.push(node.val)
    end
  end
  res
end


class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end
root = TreeNode.new(1)
root.right = TreeNode.new(2)
root.right.left = TreeNode.new(3)
def inorder_traversal(root)
  res = []
  return res if root.nil?
  stack = [root]
  other_stack = []
  while !stack.empty? || !other_stack.empty?
    if !stack.empty?
      left = stack.pop
      while left
        other_stack.push(left)
        left = left.left
      end
    end
    if !other_stack.empty?
      top = other_stack.pop
      res.push(top.val)
      if top.right
        stack.push(top.right)
      end
    end
  end
  res
end
inorder_traversal(root)

def inorder_traversal(root)
  stack = [root]
  res = []
  while !stack.empty?
    node = stack.pop
    stack.push(node.right) if node.right
    res.push(node.val)
    stack.push(node.left) if node.left
  end
  res
end
