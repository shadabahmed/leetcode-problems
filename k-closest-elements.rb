# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}

def find_closest_idx(nums, target)
  first, last = 0, nums.length - 1
  while first + 1 < last
    mid = (first + last) / 2
    if nums[mid] > target
      if nums[mid - 1] < target
        first, last = mid - 1, mid
        break
      end
      last = mid
    elsif nums[mid] < target
      if nums[mid + 1] > target
        first, last = mid, mid + 1
        break
      end
      first = mid
    else
      return mid
    end
  end
  (nums[last] - target).abs < (nums[first] - target).abs ? last : first
end

INF = 1.0 / 0

def find_closest_elements(arr, k, x)
  idx = find_closest_idx(arr, x)
  first, last = idx, idx
  while k > 1
    left_diff = first > 0 ? (x - arr[first - 1]).abs : INF
    right_diff = last < arr.length - 1 ? (x - arr[last + 1]).abs : INF
    if left_diff <= right_diff
      first -= 1
    else
      last += 1
    end
    k -= 1
  end
  arr[first..last]
end

# def find_closest_elements(arr, k, x)
#   first, last = 0, arr.length - 1
#   while first + 1 < last
#   end
#   return 1 if arr[first] == arr[last]
# end

# p get_insert_index [1, 2, 3, 4, 5], 1
# p find_closest_idx [1, 2, 3, 4, 5], 6
# p find_closest_idx [1, 2, 3, 4, 5], 0

# p find_closest_elements [0, 1, 1, 1, 2, 2, 5, 7, 8, 9], 4, 4
# p find_closest_elements [1, 2, 3, 4, 5], 2, -1

# p find_closest_elements [0, 1, 2, 3, 4, 4, 4, 5, 5, 5, 6, 7, 9, 9, 10, 10, 11, 11, 12, 13, 14, 14, 15, 17, 19, 19, 22, 24, 24, 25, 25, 27, 27, 29, 30, 32, 32, 33, 33, 35, 36, 38, 39, 41, 42, 43, 44, 44, 46, 47, 48, 49, 52, 53, 53, 54, 54, 57, 57, 58, 59, 59, 59, 60, 60, 60, 61, 61, 62, 64, 66, 68, 68, 70, 72, 72, 74, 74, 74, 75, 76, 76, 77, 77, 80, 80, 82, 83, 85, 86, 87, 87, 92, 93, 94, 96, 96, 97, 98, 99], 25, 90

p find_closest_elements [0,0,0,1,3,5,6,7,8,8], 2, 2