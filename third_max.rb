# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  first_max, second_max, third_max = nil, nil, nil
  0.upto(nums.length - 1) do |idx|
    if first_max.nil? || nums[idx] > first_max      
      third_max = second_max
      second_max = first_max
      first_max = nums[idx]
    elsif nums[idx] < first_max && (second_max.nil? || nums[idx] > second_max)
      third_max = second_max
      second_max = nums[idx]
    elsif nums[idx] < first_max && nums[idx] < second_max && (third_max.nil? || nums[idx] > third_max)
      third_max = nums[idx]
    end
  end
  if !third_max
    first_max
  else
    third_max
  end
end

# p third_max [2, 2, 3, 1]
# p third_max [2, 1]
# p third_max [3, 2, 1]
p third_max [2,2,3,1]