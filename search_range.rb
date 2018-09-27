# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  first, last = 0, nums.length - 1
  while first + 1 < last
    mid = (first + last) / 2
    if nums[mid] < target
      first = mid + 1
    elsif nums[mid] > target
      last = mid - 1
    else
      if nums[mid - 1] == target
        first = mid - 1
      else
        first = mid
      end
      if nums[last] == target
        break
      else
        last -= 1
      end
    end
  end
  if nums[first] == target && nums[last] == target
    [first, last]
  elsif nums[first] == target
    [first, first]
  else
    [-1, -1]
  end
end

def search_range(nums, target, first = 0, last = nums.length - 1)
  left, right = -1, -1
  while first <= last
    mid = (first + last) / 2
    if nums[mid] < target
      first = mid + 1
    elsif nums[mid] > target
      last = mid - 1
    else
      left, right = mid, mid
      if mid > 0 && nums[mid - 1] == target
        left, _ = search_range(nums, target, first, mid - 1)
      end
      if mid < nums.length - 1 && nums[mid + 1] == target
        _, right = search_range(nums, target, mid + 1, last)
      end
      break
    end
  end
  [left, right]
end

def search_range(nums, target, first = 0, last = nums.length - 1)
  left, right = -1, -1
  while first <= last
    mid = (first + last) / 2
    if nums[mid] < target
      first = mid + 1
    elsif nums[mid] > target
      last = mid - 1
    else
      left, right = mid, mid
      if mid > 0 && nums[mid - 1] == target
        left, _ = search_range(nums, target, first, mid - 1)
      end
      if mid < nums.length - 1 && nums[mid + 1] == target
        _, right = search_range(nums, target, mid + 1, last)
      end
      break
    end
  end
  [left, right]
end

def search_leftmost(nums, target)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last + 1) / 2
    if nums[mid] > target || nums[mid - 1] == target
      last = mid - 1
    elsif nums[mid] < target
      first = mid + 1
    else
      return mid
    end
  end
  return first if nums[first] == target
  -1
end

def search_rightmost(nums, target)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last) / 2
    if nums[mid] < target || nums[mid + 1] == target
      first = mid + 1
    elsif nums[mid] > target
      last = mid - 1
    else
      return mid
    end
  end
  return first if nums[first] == target
  -1
end

def search_range(nums, target)
  [search_leftmost(nums, target), search_rightmost(nums, target)]
end

p search_range [1, 2, 3, 3, 3, 3, 4, 5, 9], 0
# p search_leftmost [1, 2, 3, 3, 3, 3, 4, 5, 9], 3
# p search_rightmost [1, 2, 3, 3, 3, 3, 4, 5, 9], 3
