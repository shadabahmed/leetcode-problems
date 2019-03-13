# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
  stack = []
  res = [-1] * nums.length
  (nums.length - 2).downto(0) do |idx|
    insert_into_stack(stack, nums, idx)
  end
  (nums.length - 1).downto(0) do |idx|
    stack.pop while !stack.empty? && nums[stack.last] <= nums[idx]
    res[idx] = nums[stack.last] if !stack.empty?
    stack.push(idx)
  end
  res
end

def insert_into_stack(stack, nums, idx)
  while !stack.empty? && nums[idx] > nums[stack.last]
    stack.pop
  end
  stack.push(idx)
end
# p next_greater_elements [1,2,1]
# p next_greater_elements [1,2,3,4,3]
# p next_greater_elements [5,4,3,2,1]
# p next_greater_elements [5,2,4]
