# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  map, res = {}, []
  nums.each_with_index do |num, idx|
    if map.key?(-1 * num)
      p '********************'
      p map
      second_num, third_num = map[-1 * num], -1 * (num + map[-1 * num])
      res.push([num, second_num, third_num])
      map.delete(-1 * (second_num + third_num))
      map.delete(-1 * (num + third_num))
      map.delete(-1 * (num + second_num))
    end
    p map
    p '********************'
    (idx + 1).upto(nums.length - 1) do |other_idx|
      sum = nums[idx] + nums[other_idx]
      next if map.key?(sum)
      map[sum] = nums[other_idx]
    end
  end
  res
end

def pairs_summing_to(nums, sum, left, right)
  res = []
  return res if left >= right
  while left < right
    current_sum = nums[left] + nums[right]
    if current_sum == sum
      res.push([nums[left], nums[right]])
    end
    if current_sum < sum
      left += 1
    else
      right -= 1
    end
  end
  res
end

def three_sum(nums)
  res = []
  nums.sort!
  0.upto(nums.length - 3) do |idx|
    next if idx > 0 && nums[idx] == nums[idx - 1]
    num = nums[idx]
    prev_second_num = nil
    pairs_summing_to(nums, -1 * num, idx + 1, nums.length - 1).each do |second_num, third_num|
      next if prev_second_num == second_num
      prev_second_num = second_num
      res.push([num, second_num, third_num])
    end
  end
  res
end
#three_sum [1,-1,-1,0]

#three_sum [-1, 0, 1, 2, -1, -4]
three_sum [0, 0, 0, 0]
#three_sum [-1, 0, 1, 0]
