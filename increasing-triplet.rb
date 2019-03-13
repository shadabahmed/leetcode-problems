# @param {Integer[]} nums
# @return {Boolean}
def increasing_triplet(nums)
  idx = 0
  idx += 1 while idx < nums.length - 2 && nums[idx] >= nums[idx + 1]
  first = idx
  second = first + 1
  while idx < nums.length - 1
    if nums[idx] > nums[first] && nums[idx] < [second]
      second = idx
    elsif nums[idx] < nums[first]
      first = second
      second = idx
    end
    first = second if nums[first] >= nums[second]
    second = idx if nums[second] >= nums[idx + 1]
    idx += 1
  end
  second + 1 < nums.length
end

INF = 1.0 / 0

def increasing_triplet(nums)
  first, second, min = nums[0], INF, nums[0]
  1.upto(nums.length - 1) do |idx|
    if nums[idx] < second && nums[idx] > min
      first = min
      second = nums[idx]
    elsif nums[idx] > second
      return true
    end
    min = nums[idx] if nums[idx] < min
  end
  false
end

# p increasing_triplet [1, 2, 3, 4, 5]
# p increasing_triplet [1, 2]

# p increasing_triplet [2, 1, 3, 4, 5]

# p increasing_triplet [2, 1, 5, 0, 3]

# p increasing_triplet [5, 4, 3, 2, 1]

# p increasing_triplet [1, 2, -10, -8, -7]

# p increasing_triplet [1, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 100000000]

# p increasing_triplet [1, 2, -2, 5, 5, 5, 5, -1, 100]
# p increasing_triplet [2, 1, 5, 0, 3]

# p increasing_triplet [1, 0, 0, 1]

# p increasing_triplet [4, 5, 1, 5, 2, 3]

def increasing_triplet(nums)
  x1 = nums[0]; x2 = nil

  nums.each do |num|
    if num <= x1
      x1 = num
    elsif x2 == nil || num <= x2
      x2 = num
    else
      return true
    end
  end

  false
end

p increasing_triplet [1, 2, -2, -1, 0]
