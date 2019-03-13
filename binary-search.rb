# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left, right = 0, nums.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if nums[mid] == target
    if target > nums[mid]
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

p search [-1, 0, 3, 5, 9, 12], 9
