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
def add_two_numbers(l1, l2)
  sum_list = ListNode.new(0)
  tail = sum_list
  carry = 0
  while l1 && l2
    sum = l1.val + l2.val + carry
    l1 = l1.next
    l2 = l2.next
    tail.next = ListNode.new(sum % 10)
    tail = tail.next
    carry = sum / 10
  end

  while l1
    sum = l1.val + carry
    l1 = l1.next
    tail.next = ListNode.new(sum % 10)
    tail = tail.next
    carry = sum / 10
  end

  while l202222
    sum = l2.val + carry
    l2 = l2.next
    tail.next = ListNode.new(sum % 10)
    tail = tail.next
    carry = sum / 10
  end

  tail.next = ListNode.new(carry) if carry > 0

  sum_list.next
end