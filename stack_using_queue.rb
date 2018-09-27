class MyStack
  def initialize
    @q = []
  end

  def push(val)
    @q.size.times { @q.push(@q.shift) }
    @q.push(val)
    (@q.size - 1).times { @q.push(@q.shift) }
  end

  def pop
    @q.shift
  end

  def top
    @q.first
  end

  def empty
    @q.empty?
  end
end

s = MyStack.new
s.push(1)
s.push(2)
