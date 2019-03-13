class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

node = TreeNode.new(2)
node.left = TreeNode.new(1)
node.right = TreeNode.new(3)


def postorder_traversal(root)
  res = []
  return res if root.nil?
  stack, other_stack = [root], []
  while !stack.empty?
    node = stack.pop
    res.unshift(node.val)
    stack.push(node.left) if node.left
    stack.push(node.right) if node.right
  end
  res
end

postorder_traversal node
