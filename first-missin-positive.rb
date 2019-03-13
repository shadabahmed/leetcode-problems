require 'pry'

def first_missing_positive(nums)
  cache = {}
  max = 1
  nums.each do |num|
    max = num if num > max
    cache[num] = true
  end

  1.upto(max) do |num|
    return num unless cache.key?(num)
  end
  max + 1
end

def first_missing_positive(nums)
  idx = 0
  while idx < nums.length
    if nums[idx] >= 1 && nums[idx] <= nums.length && nums[idx] != idx + 1 && nums[idx] != nums[nums[idx] - 1]
      nums[nums[idx] - 1], nums[idx] = nums[idx], nums[nums[idx] - 1]
    else
      idx += 1
    end
  end
  1.upto(nums.length + 1) do |i|
    return i if nums[i - 1] != i
  end
end

p first_missing_positive [7,8,9,11,12]
p first_missing_positive [3,4,-1,1]
p first_missing_positive [1,2,0]
