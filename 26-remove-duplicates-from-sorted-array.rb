# https://leetcode.com/problems/remove-duplicates-from-sorted-array/

def remove_duplicates(nums)
  l, h = 0, 0
  while h < nums.length
    if h == nums.length - 1 || nums[h] != nums[h + 1]
      nums[l] = nums[h]
      l += 1
    end
    h += 1
  end
  l
end

arr = [0,0,1,1,1,2,2,3,3,4]
p remove_duplicates arr
p arr
