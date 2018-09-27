def zigzag_level_order(root)
  res = []
  return res if root.nil?
  level = 0
  queue = [root]
  while !queue.empty?
    queue.size.times do
      first = queue.shift
      res[level] ||= []
      if level % 2 == 0
        res[level].push(first.val)
      else
        res[level].unshift(first.val)
      end
      queue.push(first.left) if first.left
      queue.push(first.right) if first.right
    end
    level += 1
  end
  res
end


# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.left = TreeNode.new(4)
root.right.right = TreeNode.new(5)

zigzag_level_order(root)
