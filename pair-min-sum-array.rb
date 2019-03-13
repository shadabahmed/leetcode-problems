def array_pair_sum(nums)
  nums.sort!
  sum = 0
  idx = 0
  while idx < nums.length - 1
    sum += nums[idx]
    idx += 2
  end
  sum
end
