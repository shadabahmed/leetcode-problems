def sorted_array_to_bst(nums, left = 0, right = nums.length - 1)
  return nil if nums.empty?
  mid = left + (right - left) / 2
  root = TreeNode.new(arr[mid])
  root.left = sorted_array_to_bst(nums, left, mid - 1)
  root.right = sorted_array_to_bst(nums, left, mid + 1)
  root
end
