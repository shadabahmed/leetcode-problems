# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

class BSTIterator
  # @param {TreeNode} root
  attr_accessor :stack
  def initialize(root)
    self.stack = []
    move_left(root)
  end

  # @return {Boolean}
  def has_next
    !stack.empty?
  end

  # @return {Integer}
  def next
    current = stack.pop
    move_left(current.right) if current && current.right
    current && current.val
  end

  def move_left(root)
    while !root.nil?
      stack.push(root)
      root = root.left
    end
  end
end

# Your BSTIterator will be called like this:
# i, v = BSTIterator.new(root), []
# while i.has_next()
#    v << i.next
# end


root = TreeNode.new(4)
root.left = TreeNode.new(1)
root.left.right = TreeNode.new(3)
root.left.right.left = TreeNode.new(2)
root.right = TreeNode.new(5)

i, v = BSTIterator.new(root), []
while i.has_next()
   v << i.next
end

p v