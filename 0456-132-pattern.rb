# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  one_idx, two_idx, three_idx = 0, 0, 0
  0.upto(nums.length - 3) do |idx|
    one_idx = idx if nums[one_idx] > nums[idx]
  end
  (one_idx + 1).upto(nums.length - 2) do |idx|
    two_idx = idx if nums[idx] > nums[one_idx]
  end
  (two_idx + 1).upto(nums.length - 1) do |idx|
    three_idx = idx if nums[idx] < nums[two_idx]
  end
  one_idx < two_idx && two_idx < three_idx
end


# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  right_min, left_min = [], []
  0.upto(nums.length - 3) do |idx|
    if idx == 0
      left_min[idx] = nums[idx]
    elsif nums[idx] < left_min[idx - 1]
      left_min[idx] = nums[idx]
    else
      left_min[idx] = left_min[idx - 1]
    end
  end

  (nums.length - 1).downto(2) do |idx|
    if idx == nums.length - 1
      right_min[idx] = nums[nums.length - 1]
    elsif nums[idx] < right_min[idx + 1]
      right_min[idx] = nums[idx]
    else
      right_min[idx] = right_min[idx + 1]
    end
  end
  1.upto(nums.length - 2).any? do |idx|
    if nums[idx] > left_min[idx - 1]
      return true if (idx + 1).upto(nums.length - 1).any?{|r_idx| nums[r_idx] > left_min[idx - 1] && nums[r_idx] < nums[idx]}
    end
  end
end


# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  left_min = []
  0.upto(nums.length - 3) do |idx|
    if idx == 0
      left_min[idx] = nums[idx]
    elsif nums[idx] < left_min[idx - 1]
      left_min[idx] = nums[idx]
    else
      left_min[idx] = left_min[idx - 1]
    end
  end

  1.upto(nums.length - 2).any? do |idx|
    if nums[idx] > left_min[idx - 1]
      return true if (idx + 1).upto(nums.length - 1).any?{|r_idx| nums[r_idx] > left_min[idx - 1] && nums[r_idx] < nums[idx]}
    end
  end
end
p find132pattern [3,5,0,3,4]



# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  one_idx, two_idx, three_idx = 0, 0, 0
  0.upto(nums.length - 3) do |idx|
    one_idx = idx if nums[one_idx] > nums[idx]
  end
  (one_idx + 1).upto(nums.length - 2) do |idx|
    two_idx = idx if nums[idx] > nums[one_idx]
  end
  (two_idx + 1).upto(nums.length - 1) do |idx|
    three_idx = idx if nums[idx] < nums[two_idx]
  end
  one_idx < two_idx && two_idx < three_idx
end


# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  right_min, left_min = [], []
  0.upto(nums.length - 3) do |idx|
    if idx == 0
      left_min[idx] = nums[idx]
    elsif nums[idx] < left_min[idx - 1]
      left_min[idx] = nums[idx]
    else
      left_min[idx] = left_min[idx - 1]
    end
  end

  (nums.length - 1).downto(2) do |idx|
    if idx == nums.length - 1
      right_min[idx] = nums[nums.length - 1]
    elsif nums[idx] < right_min[idx + 1]
      right_min[idx] = nums[idx]
    else
      right_min[idx] = right_min[idx + 1]
    end
  end
  1.upto(nums.length - 2).any? do |idx|
    if nums[idx] > left_min[idx - 1]
      return true if (idx + 1).upto(nums.length - 1).any?{|r_idx| nums[r_idx] > left_min[idx - 1] && nums[r_idx] < nums[idx]}
    end
  end
end


# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  min = [nums[0]]
  1.upto(nums.length - 1) do |idx|
    min[idx] = [min[idx - 1], nums[idx]].min
  end
  stack = []
  (nums.length - 1).downto(1) do |idx|
    if !stack.empty? && nums[idx] > stack.last
      stack.pop while !stack.empty? && stack.last <= min[idx]
      return true if !stack.empty?
    elsif nums[idx] > min[idx]
      stack.push(nums[idx])
    end
  end
  false
end
# p find132pattern [3,5,0,3,4]
# p find132pattern [3,5,0,3,4]
p find132pattern [3,1,4,2]
p find132pattern [2,3,1,2]



# @param {Integer[]} nums
# @return {Boolean}
def find132pattern(nums)
  min_left = [nums[0]]
  min_right = []
  1.upto(nums.length - 1) do |idx|
    min_left[idx] = [min_left[idx - 1], nums[idx]].min
  end
  (nums.length - 1).downto(2) do |idx|
    if nums[idx] > min_left[idx]
      min_right[idx] = nums[idx]
    end    
  end
  [min_left, min_right]
  (nums.length - 2).downto(1) do |idx|
    return true if nums[idx] > min_left[idx] && min_right[idx + 1] && nums[idx] > min_right[idx + 1]
  end
  false
end

p find132pattern [3,1,4,2]

p find132pattern [2,3,1,2]
p find132pattern [1,2,3,4]