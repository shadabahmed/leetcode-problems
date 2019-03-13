def remove_elements(head, val)
  return if head.nil?
  dummy_head = ListNode.new(0)
  dummy_head.next = head
  prev = dummy_head
  while head
    if head.val == val
      prev.next = head.next
    else
      prev = head      
    end
    head = head.next
  end
  dummy_head.next
end
