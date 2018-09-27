class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def insert_into_bst(root, val)
  return TreeNode.new(val) if root.nil?
  if root.val > val
    root.left = insert_into_bst(root.left, val)
  else
    root.right = insert_into_bst(root.right, val)
  end
  root
end
