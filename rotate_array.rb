def reverse(arr, first, last)
  while first < last
    arr[first], arr[last] = arr[last], arr[first]
    first += 1
    last -= 1
  end
  arr
end

def rotate(nums, k)
  k = k % nums.size
  reverse(nums, 0, nums.size - 1)
  reverse(nums, 0, k - 1)
  reverse(nums, k, nums.size - 1)
end

p rotate [1,2,3,4,5], 1
p rotate [1,2,3,4,5], 2
p rotate [1,2,3,4,5], 3
p rotate [1,2,3,4,5], 4
#rotate [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27], 12
