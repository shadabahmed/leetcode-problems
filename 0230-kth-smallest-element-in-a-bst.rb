# https://leetcode.com/problems/kth-smallest-element-in-a-bst/

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

def kth_smallest(root, k)
  left_stack = [root]
  right_stack = []
  res = []
  while true
    return res.last if res.size == k
    if !left_stack.empty?
      node = left_stack.pop
      left_stack.push(node.left) if node.left
      right_stack.push(node)
    elsif !right_stack.empty?
      node = right_stack.pop
      left_stack.push(node.right) if node.right      
      res.push(node.val)
    end
  end
  res
end

def kth_smallest(root, k)
  stack = []
  node = nil
  res = nil
  while true
    while root
      stack.push(root)
      root = root.left
    end
    root = stack.pop
    k -= 1
    return root.val if k.zero?
    root = root.right
  end
  res
end



def kth_smallest(root, k)
  current = root
  while current
    if current.left
      prev = current.left
      while prev.right && prev.right != current
        prev = prev.right
      end
      if prev.right == current
        prev.right = nil
        k -= 1
        return current.val if k.zero?
        current = current.right
      else
        prev.right = current
        current = current.left
      end
    else
      k -= 1
      return current.val if k.zero?
      current = current.right
    end
  end
  -1
end

root = TreeNode.new(3)
root.left = TreeNode.new(1)
root.left.right = TreeNode.new(2)
root.right = TreeNode.new(4)

#p kth_smallest(root, 4)


root = TreeNode.new(5)
root.left = TreeNode.new(3)
root.left.left = TreeNode.new(2)
root.left.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(4)
root.right = TreeNode.new(6)
p kth_smallest(root, 4)