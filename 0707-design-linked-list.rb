class MyLinkedList
  class Node < Struct.new(:val, :next); end

  def initialize
    @head = Node.new
  end

  def get(index)
    if index >= 0 && node = get_node(index)
      node.val
    else
      -1
    end
  end

  def add_at_head(val)
    add_at_index(0, val)
  end

  def add_at_tail(val)
    tail = @head
    tail = tail.next while tail.next
    add_next_to_node(tail, val)
  end

  def add_at_index(index, val)
    #return if index < 0
    add_next_to_node(get_node(index - 1), val)    
  end

  def delete_at_index(index)
    return if index < 0
    remove_next_node(get_node(index - 1))
  end

  private
  def get_node(index)
    head = @head
    while index >= 0 && head
      head = head.next
      index -= 1
    end
    head
  end

  def add_next_to_node(node, val)
    return if node.nil?
    next_node = node.next
    node.next = Node.new(val)
    node.next.next = next_node
  end

  def remove_next_node(node)
    return if node.nil? || node.next.nil?
    node.next = node.next.next
  end
end

l = MyLinkedList.new
p l.add_at_head(1)
p l.add_at_tail(3)
p l.add_at_index(1, 2)
p l.get(1)
p l.delete_at_index(0)
p l.get(0)
require 'facets'
ops= ["MyLinkedList","addAtHead","addAtTail","addAtIndex","get","deleteAtIndex","get"]

ops = ["MyLinkedList","addAtIndex","get","deleteAtIndex"]
inputs = [[],[-1,0],[0],[-1]]
#inputs = [[],[1],[3],[4,2],[1],[-1],[1]]
l = MyLinkedList.new
1.upto(ops.length - 1) do |idx|
  p [ops[idx].pathize, *inputs[idx]]
  p l.send(ops[idx].pathize, *inputs[idx])
end