def swap_pairs(head)
  return if head.nil?
  dummy_head = ListNode.new(0)
  dummy_head.next = head
  tail = dummy_head
  while tail && tail.next
    first, mid, last = tail, tail.next, tail.next.next
    if last
      first.next = last
      mid.next = last.next
      last.next = mid
      tail = mid
    else
      break
    end
  end
  dummy_head.next
end
