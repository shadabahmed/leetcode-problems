def find_target_sum_ways(nums, s, idx = 0)
  return s.zero? ? 1 : 0 if idx >= nums.length
  count = 0
  [-1, 1].each do |mul|
    count += find_target_sum_ways(nums, s + mul * nums[idx], idx + 1)
  end
  count
end

def find_target_sum_ways(nums, s, idx = 0, cache = {})
  return s.zero? ? 1 : 0 if idx >= nums.length
  if cache[s].nil? || cache[s][idx].nil?
    count = 0
    count += find_target_sum_ways(nums, s - nums[idx], idx + 1, cache)
    count += find_target_sum_ways(nums, s + nums[idx], idx + 1, cache)
    cache[s] ||= {}
    cache[s][idx] = count
  end
  cache[s][idx]
end

# @return {Integer}
def find_target_sum_ways(nums, s)
  return s.zero? ? 1 : 0 if nums.empty?
  cache = Hash.new(0)
  cache[0] = 1
  (0..nums.size - 1).each do |idx|
    dummy = Hash.new(0)
    cache.keys.each do |k|
      dummy[k + nums[idx]] += cache[k]
      dummy[k - nums[idx]] += cache[k]
    end
    p dummy
    cache = dummy
  end
  p cache
  cache[s]
end

#p find_target_sum_ways [1, 2, 3, 4, 5], 3

# @param {Integer[]} nums
# @param {Integer} s
# @return {Integer}
def find_target_sum_ways(nums, s)
  dp = {0 => 1}
  nums.each do |num|
    next_dp = Hash.new(0)
    dp.each do |sum, count|
      next_dp[sum + num] += count
      next_dp[sum - num] += count
    end
    dp = next_dp
  end
  dp[s] || 0
end

p find_target_sum_ways [1, 1, 1, 1, 1], 3
p find_target_sum_ways [0, 0, 0, 0, 0, 0, 0, 0, 1], 1
