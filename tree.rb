class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

class Tree
  def self.create(arr, idx = 0)
    return nil if idx >= arr.length || arr[idx].nil?
    node = TreeNode.new(arr[idx])
    node.left = Tree.create(arr, 2 * idx + 1)
    node.right = Tree.create(arr, 2 * idx + 2)
    node
  end
end
