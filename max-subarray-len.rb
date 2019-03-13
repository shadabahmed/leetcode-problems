# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def max_sub_array_len(nums, k)
  map = {0 => -1}
  max_len = 0
  sum = 0
  nums.each_with_index do |num, idx|
    sum += num
    map[sum] = idx unless map.key?(sum)
    diff = sum - k
    if map.key?(diff)
      len = idx - map[diff]
      max_len = len if len > max_len
    end
  end
  max_len
end

p max_sub_array_len [1, -1, 5, -2, 3], 3
p max_sub_array_len [-2, -1, 2, 1], 1
