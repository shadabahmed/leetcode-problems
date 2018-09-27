require 'pry'

def max_sliding_window(nums, k)
  res, dequeue = [], []
  0.upto(k - 1) do |idx|
    break if idx > nums.length
    dequeue.pop while !dequeue.empty? && nums[dequeue.last] < nums[idx]
    dequeue.push(idx)
  end
  res.push(nums[dequeue.first])
  k.upto(nums.length - 1) do |idx|
    dequeue.shift if dequeue.first == idx - k
    dequeue.pop while !dequeue.empty? && nums[dequeue.last] < nums[idx]
    dequeue.push(idx)
    res.push(nums[dequeue.first])
  end
  res
end
p max_sliding_window [1,3,-1,-3,5,3,6,7], 3
