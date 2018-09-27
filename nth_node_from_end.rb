def remove_nth_from_end(head, n)
  fast_ptr = head
  while n > 0
    fast_ptr = fast_ptr.next
    n -= 1
  end
  prev, orig_head = nil, head
  while fast_ptr
    fast_ptr = fast_ptr.next
    prev = head
    head = head.next
  end

  if prev.nil?
    head.next
  else
    prev.next = head.next
    orig_head
  end
end
