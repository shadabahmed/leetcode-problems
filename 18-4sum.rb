# https://leetcode.com/problems/4sum/

def four_sum(nums, target)
  res, map = [], {}
  nums.sort!
  nums.each_with_index do |num, index|
    (index + 1).upto(nums.length - 1) do |other_idx|
      other_num = nums[other_idx]
      sum = num + other_num
      map[sum] ||= {}
      map[sum][num] = other_num
      if map[target - sum]
        res += map[target - sum].collect{|k,v| [k,v,num,other_num]}
      end
    end
  end
  res
end


def four_sum(nums, target)
  res, map = [], {}
  nums.sort!
  nums.each_with_index do |num, index|
    (index + 1).upto(nums.length - 1) do |other_idx|
      other_num = nums[other_idx]
      sum = num + other_num
      map[sum] ||= {}
      map[sum][num] = other_num
      if map[target - sum]
        res += map[target - sum].collect{|k,v| [k,v,num,other_num]}
      end
    end
  end
  res
end

def four_sum(nums, target)
  nums.sort!
  res = []
  first, fourth = 0, nums.length - 1
  while first < fourth
    sum = nums[first] + nums[fourth]
    second, third = two_sum(nums, first + 1, fourth - 1, target)
    if second > first
      res += [first, second, third, fourth].collect{|idx| nums[idx]}
    end
  end
  res
end

def four_sum(nums, target)
  nums.sort!
  res = []
  first, fourth = 0, nums.length - 1
  while first < fourth
    sum = nums[first] + nums[fourth]
    second, third = two_sum(nums, first + 1, fourth - 1, target)
    if second > first
      res += [first, second, third, fourth].collect{|idx| nums[idx]}
    end
  end
  res
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  nums.sort!
  res = []
  0.upto(nums.length - 4) do |first|
    next if first > 0 && nums[first] == nums[first - 1]
    (first + 1).upto(nums.length - 3) do |second|
      next if second > (first + 1) && nums[second] == nums[second - 1]
      valid_combos = two_sum(nums, second + 1, nums.length - 1, target - nums[first] - nums[second])
      valid_combos.each do |third, fourth|
        res << [first, second, third, fourth].collect{|idx| nums[idx]}
      end
    end
  end
  res
end

def two_sum(nums, first, last, target)
  res = []
  while first < last
    sum = nums[first] + nums[last]    
    if sum > target
      last -= 1
    elsif sum < target
      first += 1
    else
      if res.empty? || (res.length > 0 && nums[res.last[0]] != nums[first])
        res.push([first, last])
      end      
      last -= 1
      first += 1
    end
  end
  res
end

#p four_sum [1, 0, -1, 0, -2, 2], 0

#p four_sum [-3,-2,-1,0,0,1,2,3], 0

p four_sum [-5, -4, -2, -2, -2, -1, 0, 0, 1], -9