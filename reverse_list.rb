def reverse_list(head)
  return head if head.nil?
  p, c, n = nil, head, head.next
  while c
    c.next = p
    p = c
    c = n
    n = n.next if n
  end
  p
end

def reverse_list(head)
  return nil if head.nil?
  if head.next
    right = reverse_list(head.next)
    head.next.next = head
    head.next = nil
    right
  else
    head
  end
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)
p reverse_list(l1)
