def partition(nums, first, last)
  pivot = nums[first]
  low = high = first + 1
  while high <= last
    if nums[high] < pivot
      nums[low], nums[high] = nums[high], nums[low]
      low += 1
    end
    high += 1
  end
  nums[low - 1], nums[first] = nums[first], nums[low - 1]
  low - 1
end

def find_kth_largest(nums, k, first = 0, last = nums.length - 1)
  pivot_idx = partition(nums, first, last)
  kth_largest_idx = last - k + 1
  return nums[pivot_idx] if pivot_idx == kth_largest_idx
  if pivot_idx > kth_largest_idx
    find_kth_largest(nums, k - (last - pivot_idx + 1), first, pivot_idx - 1)
  else
    find_kth_largest(nums, k, pivot_idx + 1, last)
  end
end


find_kth_largest [3,2,1,5,6,4], 2
find_kth_largest [3,2,3,1,2,4,5,5,6], 9
