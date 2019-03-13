def reverse_special(head, node)
  orig_head = head
  prev, current = nil, head
  while head != node
    current = head
    head = head.next
    current.next = prev
    prev = current
  end
  orig_head.next = node
  current
end

def get_kth(head, k)
  while k > 1 && head
    head = head.next
    k -= 1
  end
  head
end

def reverse_between(head, m, n)
  return if head.nil?
  return head if m == n
  dummy_head = ListNode.new(0)
  dummy_head.next = head
  m_prev = get_kth(dummy_head, m)
  m_prev.next = reverse_special(m_prev.next, get_kth(head, n + 1))
  dummy_head.next
end
