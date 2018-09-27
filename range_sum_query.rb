class NumArray
  attr_accessor :sums
  def initialize(nums)
    self.sums = [0]
    0.upto(nums.length - 1) do |idx|
      self.sums[idx + 1] = self.sums[idx] + nums[idx]
    end
  end

  def sum_range(i, j)
    sums[j + 1] - sums[i]
  end
end

obj = NumArray.new([1,2,3,4])
p obj.sum_range(1,3)
