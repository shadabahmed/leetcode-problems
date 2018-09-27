
def find_pivot(arr, first = 0, last = arr.length - 1)
  right_sum = 0
  left_sum = 0
  arr.each do |num|
    right_sum += num
  end
  0.upto(arr.length - 1) do |idx|
    right_sum -= arr[idx]
    return idx if right_sum == left_sum
    left_sum += arr[idx]
  end
  -1
end
