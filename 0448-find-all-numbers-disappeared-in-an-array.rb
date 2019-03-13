# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  0.upto(nums.length - 1) do |idx|
    num = nums[idx]
    while num != nums[num - 1]
      nums[num - 1], num = num, nums[num - 1]
    end
  end
  res = []
  nums.each_with_index do |num, idx|
    res.push(idx + 1) if num - 1 != idx
  end
  res
end

p find_disappeared_numbers([4,3,2,7,8,2,3,1])
