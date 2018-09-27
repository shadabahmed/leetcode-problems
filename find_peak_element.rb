# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  return 0 if nums.size == 1
  first, last = 0, nums.size - 1
  while first < last
    mid = (first + last) / 2
    if nums[mid] > nums[mid + 1]
      last = mid
    else
      first = mid + 1
    end
  end
  first
end

p find_peak_element [1, 2, 3, 1]
p find_peak_element [1, 2, 1, 3, 5, 6, 4]
