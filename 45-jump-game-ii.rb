# @param {Integer[]} nums
# @return {Integer}
INFINITY = 1.0 / 0
def jump(nums)
  jumps = nums.length.times.collect { INFINITY }
  jumps[0] = 0
  0.upto(nums.length - 1) do |idx|
    ([idx + nums[idx], nums.length - 1].min).downto(idx + 1) do |jump_idx|
      break if jumps[jump_idx] < jumps[idx] + 1
      jumps[jump_idx] = jumps[idx] + 1
    end
  end
  jumps[nums.length - 1]
end
jump 250000.downto(1).collect(&:to_i)
