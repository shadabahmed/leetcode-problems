# https://leetcode.com/problems/find-the-duplicate-number/description/

def find_duplicate(nums)
  xor = 1.upto(nums.size - 1).reduce { |x, y| x ^ y }
  nums.each { |x| xor ^= x }
  xor
end

def get_next(nums, idx)
  return idx + 1 if idx < 0
  if nums[idx] == idx + 1
    nums[idx]
  else
    nums[idx] - 1
  end
end

def find_duplicate(nums)
  slow, fast = nums[0], nums[nums[0]]
  while slow != fast
    slow = nums[slow]
    fast = nums[nums[fast]]
  end
  other_slow = 0
  while slow != other_slow
    slow = nums[slow]
    other_slow = nums[other_slow]
  end
  slow
end

def find_duplicate(nums)
  first, last = 1, nums.length - 1
  while first <= last
    count = 0
    mid = (first + last) / 2
    nums.each { |num| count += 1 if num <= mid }
    if count <= mid
      first = mid + 1
    else
      last = mid - 1
    end
  end
  first
end

def find_duplicate(nums)
  first, last = 1, nums.length - 1
  while first <= last
    mid, less_count, same_count = (first + last) / 2, 0, 0
    nums.each do |num|
      less_count += 1 if num < mid
      same_count += 1 if num == mid
    end
    return mid if same_count > 1
    if less_count < mid
      first = mid + 1
    else
      last = mid - 1
    end
  end
end

# p find_duplicate [1, 1, 2]

# p find_duplicate [2, 1, 1]

p find_duplicate [1, 2, 3, 2]
p find_duplicate [1, 3, 4, 2, 2]

p find_duplicate [3, 1, 3, 4, 2]
p find_duplicate [2, 2, 2, 2, 1]
