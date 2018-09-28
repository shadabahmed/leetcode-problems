# https://leetcode.com/problems/3sum-closest/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums.sort!
  closest_sum = nil
  0.upto(nums.length - 3) do |idx|
    closest_sum_at_idx = find_two_sum(nums, idx + 1, target - nums[idx]) + nums[idx]
    if closest_sum.nil? || (target - closest_sum_at_idx).abs < (target - closest_sum).abs
      closest_sum = closest_sum_at_idx
    end
  end
  closest_sum
end

def find_two_sum(nums, idx, target)
  first, last = idx, nums.length - 1
  closest_sum = nil
  while first < last
    sum = nums[first] + nums[last]
    if closest_sum.nil? || (target - sum).abs < (target - closest_sum).abs
      closest_sum = sum
    end
    return sum if sum == target
    if sum < target
      first += 1
    elsif sum > target
      last -= 1
    end    
  end
  closest_sum
end

# p three_sum_closest [-1, 2, 1, -4], 1

# p three_sum_closest [1,2,3,4,5,6,7,8], 5
p three_sum_closest [0,1,2], 3