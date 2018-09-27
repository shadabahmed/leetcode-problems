# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last) / 2
    return nums[mid + 1] if nums[mid + 1] < nums[mid]
    if nums[mid] < nums[last]
      last = mid
    elsif nums[mid] > nums[last]
      first = mid + 1
    else
      last -= 1
    end
  end
  nums[first]
end

p find_min [2, 2, 2, 0, 1]
p find_min [1, 2, 5]
p find_min [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1]
