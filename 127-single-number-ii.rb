# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  single_num = 0
  0.upto(31) do |bit|
    count = 0
    bit_num = 1 << bit
    nums.each do |num|
      count += 1 if num & bit_num != 0
    end
    if count > 0 && count % 3 == 1
      single_num |= bit_num
    end
  end
  single_num
end

p single_number([2,2,2,3,3,3,4])