def search(nums, target)
  left, right = 0, nums.length - 1
  while left <= right
    mid = (left + right) / 2
    mid_num = nums[mid]
    return true if mid_num == target

    if nums[left] <= mid_num
      if nums[left] <= target && mid_num >= target
        right = mid - 1
      else
        left = mid + 1
      end
    elsif mid_num <= nums[right]
      if target >= mid_num && target <= nums[right]
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end
  false
end

def search(nums, target)
  nums.include?(target)
end

# p search [2, 5, 6, 0, 0, 1, 2], 0
# p search [2, 5, 6, 0, 0, 1, 2], 2

p search [1, 3, 1, 1, 1], 3
