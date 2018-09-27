class MyCircularQueue

=begin
    Initialize your data structure here. Set the size of the queue to be k.
    :type k: Integer
=end
  def initialize(k)
    @arr = []
    @size = k
    @head = 0
    @tail = 0
    @is_empty = true
    @is_full = false
  end

=begin
    Insert an element into the circular queue. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
  def en_queue(value)
    return false if is_full
    @arr[@tail] = value
    @tail = (@tail + 1) % @size
    @is_full = @tail == @head
    @is_empty = false
    true
  end

=begin
    Delete an element from the circular queue. Return true if the operation is successful.
    :rtype: Boolean
=end
  def de_queue()
    return false if is_empty
    elem = @arr[@head]
    @head = (@head + 1) % @size
    @is_full = false
    @is_empty = @tail == @head
    true
  end

=begin
    Get the front item from the queue.
    :rtype: Integer
=end
  def front()
    return -1 if is_empty
    @arr[@head]
  end

=begin
    Get the last item from the queue.
    :rtype: Integer
=end
  def rear()
    return -1 if is_empty
    @arr[(@tail - 1) % @size]
  end

=begin
    Checks whether the circular queue is empty or not.
    :rtype: Boolean
=end
  def is_empty()
    @is_empty
  end

=begin
    Checks whether the circular queue is full or not.
    :rtype: Boolean
=end
  def is_full()
    @is_full
  end
end

# Your MyCircularQueue object will be instantiated and called as such:
obj = MyCircularQueue.new(3)
obj.en_queue(1)
obj.en_queue(2)
obj.en_queue(3)
obj.en_queue(4)
param_4 = obj.rear()
param_2 = obj.de_queue()
param_5 = obj.is_empty()
param_6 = obj.is_full()
