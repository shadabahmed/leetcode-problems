def find_best(nums, first)
  prev_prev, prev = 0, 0
  first.upto(first + nums.length - 2) do |idx|
    idx = idx % nums.length
    current = [prev_prev + nums[idx], prev].max
    prev_prev = [prev_prev, prev].max
    prev = current
  end
  [prev_prev, prev].max
end

def rob(nums)
  return nums.first if nums.length < 2
  [find_best(nums, 0), find_best(nums, 1)].max
end

rob [2,1,2]