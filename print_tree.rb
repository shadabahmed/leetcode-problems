# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {String[][]}
def print_tree(root)
  rows = max_height(root)
  cols = 2 ** rows - 1
  matrix = rows.times.collect { cols.times.collect { "" } }
  print_recursive(root, matrix, 0, 0, cols - 1)
  matrix
end

def print_recursive(root, matrix, row, col_start, col_end)
  return if root.nil?
  mid = (col_start + col_end) / 2
  matrix[row][mid] = root.val.to_s
  print_recursive(root.left, matrix, row + 1, col_start, mid - 1)
  print_recursive(root.right, matrix, row + 1, mid + 1, col_end)
end

def max_height(root)
  return 0 if root.nil?
  1 + [max_height(root.left), max_height(root.right)].max
end

root = TreeNode.new(2)
root.left = TreeNode.new(1)
root.right = TreeNode.new(3)

p print_tree root
