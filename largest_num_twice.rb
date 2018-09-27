NEG_INFINITY = -1.0/0

def dominant_index(nums)
  return -1 if nums.length == 0
  return 0 if nums.length == 1
  largest_idx, second_largest_idx = -1, -1
  0.upto(nums.length - 1) do |idx|
    if largest_idx == -1 || nums[idx] > nums[largest_idx]
      second_largest_idx = largest_idx
      largest_idx = idx
    elsif second_largest_idx == - 1 || nums[idx] > nums[second_largest_idx]
      second_largest_idx = idx
    end
  end
  nums[largest_idx] >= 2 * nums[second_largest_idx] ? largest_idx : -1
end

p dominant_index [1,0]
#p dominant_index [3, 6, 1, 0]
#p dominant_index [1, 2, 3, 4]
