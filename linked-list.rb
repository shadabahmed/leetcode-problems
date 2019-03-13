# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end

  
end

class LinkedList
  def self.create(list)
    prev = ListNode.new(0)
    head_prev = prev
    list.each do |num|
      prev.next = ListNode.new(num)
      prev = prev.next
    end
    head_prev.next
  end
end