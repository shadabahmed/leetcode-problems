# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def bin_search(nums, target, first, last)
  while first <= last
    mid = (first + last) / 2
    return mid if nums[mid] == target
    if nums[mid] > target
      last = mid - 1
    else
      first = mid + 1
    end
  end
  -1
end

def search(nums, target)
  return -1 if nums.empty?
  beginning = search_beginning(nums)
  if beginning > 0 && target >= nums[0]
    bin_search(nums, target, 0, beginning - 1)
  else
    bin_search(nums, target, beginning, nums.length - 1)
  end
end

def search_beginning(nums)
  left, right = 0, nums.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if (mid == 0 || nums[mid - 1] > nums[mid]) && (mid == nums.length - 1 || nums[mid] < nums[mid + 1])
    if nums[mid] > nums[right]
      left = mid + 1
    else
      right = mid - 1
    end
  end
end

INF = 1.0 / 0
NEG_INF = -1.0 / 0

def search(nums, target)
  left, right = 0, nums.length - 1
  while left <= right
    mid = (left + right) / 2
    mid_num = nums[mid]
    return mid if mid_num == target

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
  -1
end

# arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# 0.upto(9) do |rotation|
#   p rotation
#   p search_beginning(arr.rotate(-1 * rotation))
# end
# # p search_beginning [1, 2, 3, 4]
# # p search_beginning [5, 1, 2, 3, 4]
# # p search_beginning [4, 5, 6, 7, 8, 1, 2, 3]
p search [4, 5, 6, 7, 8, 1, 2, 3], 2
p search [4, 5, 6, 7, 8, 1, 2, 3], 3
p search [4, 5, 6, 7, 8, 1, 2, 3], 4
p search [4, 5, 6, 7, 8, 1, 2, 3], 5
p search [4, 5, 6, 7, 8, 1, 2, 3], 6
p search [4, 5, 6, 7, 8, 1, 2, 3], 7
p search [4, 5, 6, 7, 8, 1, 2, 3], 8
p search [4, 5, 6, 7, 8, 1, 2, 3], 1

p search [2, 5, 6, 0, 0, 1, 2], 0
