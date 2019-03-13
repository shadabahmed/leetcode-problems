class Solution
  def initialize(nums)
    @nums = nums
  end

  def pick(target)
    target_count, result = 0, nil
    @nums.each_with_index do |num, index|
      if num == target
        target_count += 1
        result = index if rand(target_count) == 0
      end
    end
    result
  end
end

# Your Solution object will be instantiated and called as such:
obj = Solution.new([1,2,3,3,3])
p obj.pick(3)
