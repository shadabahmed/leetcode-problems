# https://leetcode.com/problems/next-permutation/

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  swap_idx = 0
  (nums.length - 1).downto(0) do |idx|
    swap_idx = idx
    break if idx > 0 && nums[idx] > nums[idx - 1]
  end
  if swap_idx > 0
    larger_idx = larger_idx(nums, swap_idx, nums[swap_idx - 1])
    nums[swap_idx - 1], nums[larger_idx] = nums[larger_idx], nums[swap_idx - 1]
  end
  reverse(nums, swap_idx)
  nums
end

def larger_idx(nums, start, target)
  last = nums.length - 1
  while last >= start
    break if nums[last] > target
    last -= 1
  end
  last
end

def reverse(nums, idx)
  first, last = idx, nums.length - 1
  while first < last
    nums[first], nums[last] = nums[last], nums[first]
    first += 1
    last -= 1
  end  
end

#p next_permutation [1,2,3,4]
p next_permutation [1,2,4,3]
p next_permutation [1,3,2]
p next_permutation [2,3,1]
p next_permutation [2,1,3]
p next_permutation [3,2,1]

p next_permutation [5,4,7,5,3,2]