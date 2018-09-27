def subsets(nums, idx = 0, stack = [], res = [])
  return res.push(stack.clone) if idx >= nums.length
  stack.push(nums[idx])
  subsets(nums, idx + 1, stack, res)
  stack.pop
  subsets(nums, idx + 1, stack, res)
  res
end
