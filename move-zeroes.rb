def move_zeroes(nums)
  l, h = 0, 0
  while h < nums.length
    if nums[h] != 0
      nums[h], nums[l] = nums[l], nums[h]
      l += 1
    end
    h += 1
  end
end

nums = [0, 1, 0, 3, 12]

p move_zeroes nums
p nums
