def find_tilt_h(root)
  return [0, 0] if root.nil?
  left_tilt_sum, left_sum = find_tilt_h(root.left)
  right_tilt_sum, right_sum = find_tilt_h(root.right)
  [left_tilt_sum + right_tilt_sum + (left_sum - right_sum).abs, left_sum + right_sum + root.val]
end

def find_tilt(root)
  find_tilt_h(root).first
end
