# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  l1_len, l2_len = get_length(l1), get_length(l2)
  head, carry = if l1_len == l2_len
                  add_equal_lists(l1, l2)
                elsif l1_len > l2_len
                  add_equal_lists(l1, extend_list(l2, l1_len - l2_len))
                else
                  add_equal_lists(extend_list(l1, l2_len - l1_len), l2)
                end
  if carry > 0
    node = ListNode.new(carry)
    node.next = head
    head = node
  end
  head
end

def extend_list(head, extra_len)
  new_head = ListNode.new(0)
  new_tail = new_head
  while extra_len > 1
    new_tail.next = ListNode.new(0)
    new_tail = new_tail.next
    extra_len -= 1
  end
  new_tail.next = head
  new_head
end

def get_length(head)
  len = 0
  while head
    len += 1
    head = head.next
  end
  len
end

def add_equal_lists(l1, l2)
  return [nil, 0] if l1.nil? || l2.nil?
  next_node, carry = add_equal_lists(l1.next, l2.next)
  sum = carry + l1.val + l2.val
  node = ListNode.new(sum % 10)
  node.next = next_node
  carry = sum / 10  
  [node, carry]
end

l1 = ListNode.new(7)
l1.next = ListNode.new(2)
l1.next.next = ListNode.new(4)
l1.next.next.next = ListNode.new(3)

l2 = ListNode.new(5)
l2.next = ListNode.new(6)
l2.next.next = ListNode.new(4)

p add_two_numbers(l1, l2)