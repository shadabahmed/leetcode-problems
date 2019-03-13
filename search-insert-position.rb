# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last) / 2
    if nums[mid] < target
      first = mid + 1
    elsif nums[mid] > target
      last = mid
    else
      return mid
    end
  end
  target > nums[first] ? first + 1 : first
end

p search_insert [1, 3, 5, 6], 0
p search_insert [1, 3, 5, 6], 7
p search_insert [1, 3, 5, 6], 2
p search_insert [1, 3, 5, 6], 5
p search_insert [1, 3, 5, 6], 7
