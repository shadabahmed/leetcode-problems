# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def find_mode(root, parent = nil)
  return [[], 0] if root.nil?
  left_modes, left_count = find_mode(root.left, root)
  right_modes, right_count = find_mode(root.right, root)
  if left_modes == right_modes
    [left_modes + right_modes, left_count]
  elsif right_count > left_count
    [right_modes, right_count]
  else
    [left_modes, left_count]
  end
end

def find_mode(root, parent_val = nil)
  return [[], 0, 0] if root.nil?
  left_modes, left_count, left_root_val = find_mode(root.left, root.val)
  right_modes, right_count, right_root_val = find_mode(root.right, root.val)
  child_modes, child_count = if left_count == right_count
                               [left_modes + right_modes, left_count]
                             elsif left_count > right_count
                               [left_modes, left_count]
                             else
                               [right_modes, right_count]
                             end
  root_val_count = left_root_val + right_root_val + 1

  if parent_val == root.val
    [child_modes, child_count, root_val_count]
  elsif root_val_count == child_count
    [child_modes << root.val, child_count, 0]
  elsif root_val_count > child_count
    [[root.val], root_val_count, 0]
  else
    [child_modes, child_count, 0]
  end
end

def find_mode(root, parent = nil)
  return [[], 0] if root.nil?
  left_modes, left_count = find_mode(root.left, root)
  right_modes, right_count = find_mode(root.right, root)
  child_modes, child_count = if left_count == right_count
                               [left_modes + right_modes, left_count]
                             elsif left_count < right_count
                               [right_modes, right_count]
                             else
                               [left_modes, left_count]
                             end

  if parent && parent.val == root.val
    [child_modes, child_count]
  else
    root_count = find_count(root, root)
    if root_count > child_count
      [[root.val], root_count]
    elsif root_count == child_count
      [child_modes << root.val, child_count]
    else
      [child_modes, child_count]
    end
  end
end

def find_count(root, parent)
  return 0 if root.nil?
  count = 1 if root.val == parent.val
  count += find_root_vals(root.left, parent)
  count += find_root_vals(root.right, parent)
  count
end

class FindModeSolution
  attr_reader :solution

  def initialize()
    @current = nil
    @prev = nil
    @max_count = 0
    @solution = []
  end

  def inorder(root)
    return if root.nil?
    inorder(root.left)
    if @prev && root.val == @prev.val
      @current_count += 1
    else
      @current_count = 1
    end
    if @current_count > @max_count
      @max_count = @current_count
      @solution = [root.val]
    elsif @current_count == @max_count
      @solution << root.val
    end
    @prev = root
    inorder(root.right)
  end
end

def find_mode(root)
  x = FindModeSolution.new
  x.inorder(root)
  x.solution
end

root = TreeNode.new(1)
root.right = TreeNode.new(2)
root.right.right = TreeNode.new(3)
root.right.right.left = TreeNode.new(3)
root.right.left = TreeNode.new(2)
p find_mode(root)
