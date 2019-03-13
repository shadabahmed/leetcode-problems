# https://leetcode.com/problems/maximum-average-subarray-i/

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  sum = 0
  0.upto(k - 1) do |idx|
    sum += nums[idx]    
  end
  max_sum = sum
  k.upto(nums.length - 1) do |idx|
    sum += nums[idx] - nums[idx - k]
    max_sum = sum if sum > max_sum
  end
  max_sum.to_f / k
end

p find_max_average [1,12,-5,-6,50,3], 4