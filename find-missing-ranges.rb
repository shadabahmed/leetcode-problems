# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {String[]}
def find_missing_ranges(nums, lower, upper)
  res = []
  0.upto(nums.length) do |idx|
    prev = idx == 0 ? lower - 1 : nums[idx - 1]
    prev = lower - 1 if prev < lower
    current = idx == nums.length ? upper + 1 : nums[idx]
    current = upper + 1 if current > upper
    if current > prev + 2
      res.push("#{prev + 1}->#{current - 1}")
    elsif current == prev + 2
      res.push("#{prev + 1}")
    end
  end
  res
end

# p find_missing_ranges [0, 1, 3, 50, 75], 0, 99
# p find_missing_ranges [0, 1, 3, 50, 75], 2, 2
p find_missing_ranges [1, 3, 6, 8, 100], 2, 6
