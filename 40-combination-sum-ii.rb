# https://leetcode.com/problems/combination-sum-ii/
# Input: candidates = [10,1,2,7,6,1,5], target = 8,
# A solution set is:
# [
#   [1, 7],
#   [1, 2, 5],
#   [2, 6],
#   [1, 1, 6]
# ]

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target, idx = 0, nums= [], res = Set.new)
  return res.add(nums.clone.sort) if target.zero? && idx >= candidates.length && !nums.empty?
  return res if idx >= candidates.length
  nums.push(candidates[idx])
  combination_sum2(candidates, target - nums.last, idx + 1, nums, res)
  nums.pop
  combination_sum2(candidates, target, idx + 1, nums, res)
  res
end


candidates = [10,1,2,7,6,1,5]
target = 8

def combination_sum2(candidates, target)
  map = {}
  candidates.each do |num|
    new_map = {}
    map.each do |sum, combinations|
      update_map(new_map, sum + num, num, combinations, target)
    end
    update_map(new_map, num, num, [[]], target)
    map.merge!(new_map)
  end  
  map[target]
end

def update_map(map, sum, num, combinations, target)
  if sum <= target
    map[sum] ||= Set.new
    combinations.each do |combination|
      combination += [num]
      map[sum].add(combination.sort)
    end        
  end
end


def combination_sum2(candidates, target)
  candidates.sort!
  dp = (candidates.size + 1).times.collect { (target + 1).times.collect{ false }}
  dp[0][0] = true
  1.upto(candidates.size) do |len|
    num = candidates[len - 1]
    dp[len][num] = true if num <= target
    0.upto(target) do |sum|
      dp[len][sum] = dp[len - 1][sum]
      next if sum < num
      dp[len][sum] ||= dp[len - 1][sum - num]
    end
  end
  find_recursively(dp, target, candidates).to_a
end

def find_recursively(dp, target, candidates, idx = candidates.length - 1, res = Set.new, stack = [])
  return res.add(stack.clone) if target.zero? && idx < 0
  return res if idx < 0
  num = candidates[idx]  
  if num > target
    find_recursively(dp, target, candidates, idx - 1, res, stack)
  elsif dp[idx + 1][target]
    stack.unshift(num)
    find_recursively(dp, target - num, candidates, idx - 1, res, stack)
    stack.shift
    find_recursively(dp, target, candidates, idx - 1, res, stack)
  end
  res
end


p combination_sum2(candidates, target)

