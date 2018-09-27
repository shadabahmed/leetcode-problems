def reverse_list(head)
  p, c, n = nil, head, head.next
  while c
    c.next = p
    p = c
    c = n
    n = n.next if n
  end
  p
end

def is_palindrome(head)
  slow, fast = head, head.next
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end
  first_half_tail = slow
  return true unless first_half_tail.next
  first_half_head = head
  second_half_head = other_half_head = reverse_list(first_half_tail.next)
  while second_half_head
    return false if first_half_head.val != second_half_head
    first_half_head = first_half_head.next
    second_half_head = second_half_head.next
  end
  first_half_tail.next = reverse_list(second_half_head)
  true
end
