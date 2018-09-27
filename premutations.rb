def permute(nums, idx = 0, res = [])
  return res.push(nums.clone) if idx >= nums.length
  idx.upto(nums.length - 1) do |swap_idx|
    nums[idx], nums[swap_idx] = nums[swap_idx], nums[idx]
    permute(nums, idx + 1, res)
    nums[swap_idx], nums[idx] = nums[idx], nums[swap_idx]
  end
  res
end


def permute_unique(nums, idx = 0, res = [])
  return res.push(nums.clone) if idx >= nums.length
  permuted = Set.new
  idx.upto(nums.length - 1) do |swap_idx|
    next if permuted.include?(nums[swap_idx])
    permuted.add(nums[swap_idx])
    nums[idx], nums[swap_idx] = nums[swap_idx], nums[idx]
    permute_unique(nums, idx + 1, res)
    nums[swap_idx], nums[idx] = nums[idx], nums[swap_idx]
  end
  res
end

permute_unique [1,1,2]
