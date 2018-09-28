# https://leetcode.com/problems/reverse-nodes-in-k-group/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return nil if head.nil?
  return head if k == 1
  tail, count = head, 1
  while count < k && tail
    tail = tail.next
    count += 1
  end
  if tail
    next_node = tail.next
    tail.next = nil
    tail = head
    head = reverse(head)
    tail.next = reverse_k_group(next_node, k)
    head
  else
    head
  end
end

def reverse(head)
  return if head.nil?
  prev, current = nil, head
  while true
    next_node = current.next
    current.next = prev
    prev = current
    return current unless next_node
    current = next_node
  end
end
