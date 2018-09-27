class TwoSum

=begin
    Initialize your data structure here.
=end
  def initialize()
    @nums = Hash.new(0)
  end

=begin
    Add the number to an internal data structure..
    :type number: Integer
    :rtype: Void
=end
  def add(number)
    @nums[number] += 1
  end

=begin
    Find if there exists any pair of numbers which sum is equal to the value.
    :type value: Integer
    :rtype: Boolean
=end
  def find(value)
    @nums.keys.any? do |num|
      pair = value - num
      if pair == num
        @nums[num] > 1
      else
        @nums.key?(value - num)
      end
    end
  end
end

# Your TwoSum object will be instantiated and called as such:
obj = TwoSum.new()
obj.add(3)
obj.add(5)
obj.add(4)
obj.add(4)
#
p obj.find(7)
p obj.find(8)
p obj.find(6)
