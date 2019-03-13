# @param {Integer[]} find_nums
# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_element(find_nums, nums)
  map = {}
  stack = []
  (nums.length - 1).downto(0) do |idx|
    stack.pop while !stack.empty? && stack.last < nums[idx]
    map[nums[idx]] = stack.last || -1
    stack.push(nums[idx])
  end
  map
  find_nums.collect{|num| map[num]}
end

nums1 = [4,1,2]
nums2 = [1,3,4,2]

p next_greater_element(nums1, nums2)