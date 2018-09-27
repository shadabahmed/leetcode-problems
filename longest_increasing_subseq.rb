# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  dp, max = [0] * (nums.length + 1), 0
  dp[1] = 1
  1.upto(nums.length) do |len|
    (len - 1).downto(1) do |prev_len|
      cur_length = if nums[len - 1] > nums[prev_len - 1]
                     dp[prev_len] + 1
                   else
                     1
                   end
      dp[len] = cur_length if cur_length > dp[len]
    end
    max = dp[len] if dp[len] > max
  end
  max
end

p length_of_lis []
p length_of_lis [10]
p length_of_lis [10, 9, 2, 5, 3, 7, 101, 18]

p length_of_lis [1, 3, 6, 7, 9, 4, 10, 5, 6]
