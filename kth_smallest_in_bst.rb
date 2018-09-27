class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

def kth_smallest_helper(root, k)
  return [nil, 0] if root.nil?
  kth_smallest_left, num_left = kth_smallest_helper(root.left, k)
  kth_smallest_right, num_right = kth_smallest_helper(root.right, k - num_left - 1)
  kth_smallest = if kth_smallest_left.nil?
                  if  num_left == k - 1
                    root
                  else
                    kth_smallest_right
                  end
                else
                  kth_smallest_left
                end
  [kth_smallest, num_left + num_right + 1]
end

def kth_smallest(root, k)
  kth_smallest_helper(root, k)[0]
end

root = TreeNode.new(3)
root.left = TreeNode.new(1)
root.left.right = TreeNode.new(2)
root.right = TreeNode.new(4)

kth_smallest(root, 1)
