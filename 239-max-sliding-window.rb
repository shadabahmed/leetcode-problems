# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  res = []
  max_queue = []
  0.upto(k - 1) do |idx|
    while max_queue.length > 0 && nums[idx] > nums[max_queue[-1]]
      max_queue.pop
    end
    max_queue << idx
  end
  res << nums[max_queue.first] unless max_queue.empty?
  k.upto(nums.length - 1) do |idx|
    if max_queue.length > 0 && idx - max_queue.first >= k
      max_queue.shift
    end
    while max_queue.length > 0 && nums[idx] > nums[max_queue[-1]]
      max_queue.pop
    end
    max_queue << idx
    res << nums[max_queue.first]
  end
  res
end

p max_sliding_window [1, -1], 1
#p max_sliding_window [1 , 3,  -1, -3,  5,  3,  6,  7], 3
