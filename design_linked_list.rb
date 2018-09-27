require 'pry'

class MyLinkedList
  class Node < Struct.new(:val, :next); end

=begin
  Initialize your data structure here.
=end
  def initialize()
    @head = nil
  end

=begin
  Get the value of the index-th node in the linked list. If the index is invalid, return -1.
  :type index: Integer
  :rtype: Integer
=end
  def get(index)
    return -1 if @head.nil?
    head = @head
    while index > 0 && head
      head = head.next
      index -= 1
    end
    index == 0 && head ? head.val : -1
  end

=begin
  Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
  :type val: Integer
  :rtype: Void
=end
  def add_at_head(val)
    node = Node.new(val)
    node.next = @head
    @head = node
  end


=begin
  Append a node of value val to the last element of the linked list.
  :type val: Integer
  :rtype: Void
=end
  def add_at_tail(val)
    return add_at_head(val) if @head.nil?
    tail = @head
    tail = tail.next while tail.next
    tail.next = Node.new(val)
  end

=begin
  Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted.
  :type index: Integer
  :type val: Integer
  :rtype: Void
=end
  def add_at_index(index, val)
    return add_at_head(val) if index == 0
    return if @head.nil?
    tail = @head
    while index > 1 && tail.next
      tail = tail.next
      index -= 1
    end
    if index == 1
      next_node = tail.next
      tail.next = Node.new(val)
      tail.next.next = next_node
    end
  end

=begin
  Delete the index-th node in the linked list, if the index is valid.
  :type index: Integer
  :rtype: Void
=end
  def delete_at_index(index)
    return if @head.nil?
    if index == 0
      @head = @head.next
    else
      prev = nil
      tail = @head
      while index > 0 && tail
        prev = tail
        tail = tail.next
        index -= 1
      end
      if index == 0 && tail
        prev.next = tail.next
      end
    end
  end
end
# Your MyLinkedList object will be instantiated and called as such:
'''
obj = MyLinkedList.new()
obj.get(1)
obj.add_at_head(1)
obj.add_at_tail(3)
obj.add_at_index(1, 2)
obj.get(1)
obj
obj.delete_at_index(1)
obj.get(1)
'''
