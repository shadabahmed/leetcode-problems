# @param {Integer[]} nums
# @return {Integer}
INFINITY = 1.0 / 0

def find_min(nums, first = 0, last = nums.length - 1)
  return INFINITY if first > last
  mid = (first + last) / 2
  if nums[mid] < nums[last]
    [nums[mid], find_min(nums, first, mid - 1)].min
  else
    [nums[first], find_min(nums, mid + 1, last)].min
  end
end

def find_min(nums)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last) / 2
    return nums[mid] if mid > 0 && nums[mid] < nums[mid - 1]
    if nums[mid] < nums[last]
      last = mid
    else
      first = mid + 1
    end
  end
  nums[first]
end

def find_min(nums)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last) / 2
    return nums[mid + 1] if nums[mid + 1] < nums[mid]
    if nums[mid] < nums[last]
      last = mid
    else
      first = mid + 1
    end
  end
  nums[first]
end

p find_min [5, 1, 2, 3, 4]

p find_min [3, 4, 5, 1, 2]

p find_min [2, 1]
