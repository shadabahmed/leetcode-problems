require 'pry'

# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}


def find_mid(head)
  s_ptr, f_ptr = head, head.next
  while f_ptr && f_ptr.next
    s_ptr = s_ptr.next
    f_ptr = f_ptr.next&.next
  end
  mid_next = s_ptr.next
  s_ptr.next = nil
  mid_next
end

def merge_lists(left, right)
  head = tail = ListNode.new(0)
  while left && right
    if left.val <= right.val
      tmp = left.next
      tail.next = left
      left = tmp
    else
      tmp = right.next
      tail.next = right
      right = tmp
    end
    tail = tail.next
  end
  while left
    tail.next = left
    left = left.next
    tail = tail.next
  end

  while right
    tail.next = right
    right = right.next
    tail = tail.next
  end
  tail.next = nil
  head.next
end

def sort_list(head)
  return head if head.nil? || head.next.nil?
  mid = find_mid(head)
  left = sort_list(head)
  right = sort_list(mid)
  merge_lists(left, right)
end

head = tail = ListNode.new(0)
[4,2,1,3].each do |num|
  tail.next = ListNode.new(num)
  tail = tail.next
end

p sort_list(head.next)
