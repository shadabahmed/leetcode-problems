# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def swap(arr, idx1, idx2)
  arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
end

def sort_colors(nums)
  first, third, idx = 0, nums.length - 1, 0
  while idx < nums.length
    num = nums[idx]
    if num.zero?
      swap(nums, idx, first)
      first += 1
    elsif num == 2 && idx < third
      swap(nums, idx, third)
      third -= 1
      idx -= 1
    end
    idx += 1
  end
  nums
end

p sort_colors [0, 0, 0, 0, 0, 0, 2, 0, 1]
p sort_colors [1, 2, 0]
