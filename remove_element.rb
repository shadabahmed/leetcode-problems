def remove_element(nums, val)
  l, h = 0, 0
  while h <= nums.length
    if nums[h] == val
      nums[h], nums[l] = nums[l], nums[h]
      l += 1
    end
    h += 1
  end
  l
end
