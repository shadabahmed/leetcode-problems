# @param {Integer[]} nums
# @return {Integer}
def path_sum(nums, expected = 11, idx = 0)
  return [idx - 1, 0] if idx >= nums.length || nums[idx] / 10 != expected
  val = nums[idx] % 10
  return val if idx == nums.length - 1
  sum = 0
  left_expected, right_expected = children(expected)
  left_idx, left_sum = path_sum(nums, left_expected, idx + 1)
  if left_idx > idx
    sum += val + left_sum
  end
  right_idx, right_sum = path_sum(nums, right_expected, left_idx + 1)
  if right_idx > idx
    sum += val + left_sum
  end
  sum
end

def path_sum(nums)
  return 0 if nums.empty?
  map = {}
  nums.each do |num|
    map[num / 10] = num % 10
  end
  path_sum_h(nums.first / 10, map)
end

def path_sum_h(node, map, sum = 0)
  return 0 unless map.key?(node)
  left_child, right_child = children(node)
  sum += map[node]
  if map.key?(left_child) || map.key?(right_child)
    path_sum_h(left_child, map, sum) + path_sum_h(right_child, map, sum)    
  else
    sum
  end  
end

def children(num)
  depth = num / 10
  position = num % 10
  left_child = ((depth + 1) * 10) + 2 * position - 1
  [left_child, left_child + 1]
end



# p children 31
# p children 32
# p children 33
# p children 34
p path_sum [113, 215, 221]

p path_sum [113, 221]

p path_sum [113,229,349,470,485]