def merge(left_arr, right_arr, inv)
  l, r, i = 0, 0, 0
  res = []
  while l < left_arr.length && r < right_arr.length
    if left_arr[l] <= right_arr[r]
      res[i] = left_arr[l]
      inv += i - l
      l += 1
    else
      res[i] = right_arr[r]
      r += 1
    end
    i += 1
  end
  while l < left_arr.length
    res[i] = left_arr[l]
    inv += i - l
    i += 1
    l += 1
  end

  while r < right_arr.length
    res[i] = right_arr[r]
    i += 1
    r += 1
  end
  [res, inv]
end

def inversions(nums, first = 0, last = nums.length - 1)
  return [[], 0] if first > last
  return [[nums[first]], 0] if first == last
  mid = first + (last - first) / 2
  left_arr, left_inv = inversions(nums, first, mid)
  right_arr, right_inv = inversions(nums, mid + 1, last)
  merge(left_arr, right_arr, left_inv + right_inv)
end

p inversions [1,2,3,4,5]
p inversions [1,2,5,3,4]
p inversions [5,4,3,2,1]
p inversions [10,20,50,40,30]
