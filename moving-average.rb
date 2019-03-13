class MovingAverage

=begin
    Initialize your data structure here.
    :type size: Integer
=end
  def initialize(size)
    @queue = []
    @size = size
    @sum = 0
  end

=begin
    :type val: Integer
    :rtype: Float
=end
  def next(val)
    if @queue.size == @size
      @sum -= @queue.shift
    end
    @queue.push(val)
    @sum += val
    @sum.to_f / @queue.size
  end
end

# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage.new(size)
# param_1 = obj.next(val)
