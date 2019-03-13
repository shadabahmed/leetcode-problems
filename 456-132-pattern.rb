# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  one_idx, two_idx, three_idx = 0, 0, 0
  0.upto(nums.length - 3) do |idx|
    one_idx = idx if nums[one_idx] > nums[idx]
  end
  (one_idx + 1).upto(nums.length - 2) do |idx|
    two_idx = idx if nums[idx] > nums[one_idx]
  end
  (two_idx + 1).upto(nums.length - 1) do |idx|
    three_idx = idx if nums[idx] < nums[two_idx]
  end
  one_idx < two_idx && two_idx < three_idx
end

p find132pattern [3,1,4,2]