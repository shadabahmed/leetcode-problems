def delete_duplicates(head)
  return if head.nil?
  orig_head = head
  while head
    current = head
    head = head.next
    while head && current.val == head.val
      head = head.next
    end
    current.next = head
  end
  orig_head
end
