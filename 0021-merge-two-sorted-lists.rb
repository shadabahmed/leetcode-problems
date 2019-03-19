# https://leetcode.com/problems/merge-two-sorted-lists/

def merge_two_lists(left, right)
  head = tail = ListNode.new(0)
  while left && right
    if left.val <= right.val
      tail.next = left
      left = left.next
    else
      tail.next = right
      right = right.next
    end
    tail = tail.next
  end

  if left
    tail.next = left
  end

  if right
    tail.next = right
  end

  head.next
end


















# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  head = ListNode.new(0)
  tail = head
  while l1 && l2
    if l1.val < l2.val
      tail.next = l1
      tail = tail.next
      l1 = l1.next
    else
      tail.next = l2
      tail = tail.next
      l2 = l2.next
    end
  end

  while l1
    tail.next = l1
    tail = tail.next
    l1 = l1.next  
  end

  while l2
    tail.next = l2
    tail = tail.next
    l2 = l2.next  
  end
  head.next
end

