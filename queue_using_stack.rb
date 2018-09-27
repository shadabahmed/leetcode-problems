class MyQueue

  def initialize()
    @stack = []
  end

  def push(x)
    insert_at_bottom(@stack, x)
  end

  def pop()
    @stack.pop
  end

  def peek()
    @stack.last
  end

  def empty()
    @stack.empty?
  end

  def insert_at_bottom(stack, val)
    if stack.empty?
      stack.push(val)
    else
      current_val = stack.pop
      insert_at_bottom(stack, val)
      stack.push(current_val)
    end
  end
end

q = MyQueue.new
q.push(1)
q.push 2
