def depth_dia_tree(root)
  return [0,0] if root.nil?
  left_depth, left_dia = diameter_of_binary_tree(root.left)
  right_depth, right_dia = diameter_of_binary_tree(root.right)
  [1 + [left_depth, right_depth].max,
   [left_dia, right_dia, left_depth + right_depth].max]
end

def diameter_of_binary_tree(root)
  depth_dia_tree(root)[1]
end
