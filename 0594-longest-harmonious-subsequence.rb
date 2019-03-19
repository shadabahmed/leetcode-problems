# @param {Integer[]} nums
# @return {Integer}
def find_lhs(nums)
  max_overall_length = 0
  0.upto(nums.length - 1) do |idx|
    min, max = nums[idx], nums[idx]
    min_length, max_length = 1, 1
    (idx + 1).upto(nums.length - 1) do |other_idx|
      if nums[other_idx] == nums[idx] || nums[other_idx] == nums[idx] + 1
        max = nums[other_idx] if nums[other_idx] > nums[idx]
        min_length += 1
      end
      max_overall_length = min_length if min_length > max_overall_length && max != nums[idx]

      if nums[other_idx] == nums[idx] || nums[other_idx] == nums[idx] - 1
        min = nums[other_idx] if nums[other_idx] < nums[idx]
        max_length += 1
      end
      max_overall_length = max_length if max_length > max_overall_length && min != nums[idx]
    end    
  end
  max_overall_length
end

p find_lhs [1,3,2,2,5,2,3,7]
p find_lhs [1,1,1,1]