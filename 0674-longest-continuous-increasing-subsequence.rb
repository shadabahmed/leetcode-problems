# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  return 0 if nums.empty?
  longest_length = 1
  current_length = 1
  idx = 1
  while idx < nums.length
    if nums[idx] > nums[idx - 1]
      current_length += 1
      longest_length = current_length if current_length > longest_length
    else
      current_length = 1
    end
    idx += 1
  end
  longest_length  
end

p find_length_of_lcis [1,3,5,4,7]