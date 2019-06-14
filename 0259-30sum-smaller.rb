# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_smaller(nums, target)
  nums.sort!
  res = []
  0.upto(nums.length - 2) do |idx|
    first = nums[idx]
    find_nums_less_than(nums, idx + 1, target - first).each do |second, third|
      res << [first, second, third]
    end
  end
  res
end

def find_nums_less_than(nums, idx, target)
  first, last = idx, nums.length - 1
  res = []
  last -= 1 while last > first && nums[first] + nums[last] >= target
  while first < last
    res << [nums[first], nums[last]]
    first += 1
    last -= 1
  end
  res
end

p three_sum_smaller nums = [-2,0,1,3], target = 2