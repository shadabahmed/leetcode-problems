# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def min(root)
  return nil if root.nil?
  min_node = min(root.left) || root
  min_node.val
end

def find_second_minimum_value(root, parent_val = nil)
  return root if root.nil?
  second_min = parent_val
  if root.left.nil? && !root.right.nil?
    second_min = min(root.right)
  elsif root.left
    second_min = find_second_minimum_value(root.left, root.val)
  end
  second_min
end


# @param {TreeNode} root
# @return {Integer}
def find_second_minimum_value(root, parent_val = nil)
  return -1 if root.nil? || root.left.nil?
  min = root.val
  second_min = -1
  if root.left && root.left.val > min
    second_min = root.left.val
  end
  if root.right && root.right.val > min && (second_min == -1 || root.right.val < second_min)
    second_min = root.right.val
  end
  second_min
end



# @param {TreeNode} root
# @return {Integer}
def find_second_minimum_value(root, parent_val = nil)
  return -1 if root.nil? || root.left.nil?
  min = root.val
  second_min = -1
  if root.left && root.right
    if root.left.val > min
      second_min = root.left.val
    elsif root.left.val == min
      second_min = find_second_minimum_value(root.left)
    end
    if root.right.val > min && (second_min == -1 || root.right.val < second_min)
      second_min = root.right.val
    elsif root.right.val == min
      right_min = find_second_minimum_value(root.right)
      second_min = right_min if (second_min == -1 || right_min != -1 && right_min < second_min)
    end
  end
  second_min
end

root = TreeNode.new(5)
root.left = TreeNode.new(8)
root.right = TreeNode.new(5)
p find_second_minimum_value root