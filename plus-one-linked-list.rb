def increment(head)
  return 1 if head.nil?
  carry = increment(head.next)
  if carry > 0
    sum = head.val + carry
    head.val = sum % 10
    carry = sum / 10
  end
  carry
end

def plus_one(head)
  return head if head.nil?
  carry = increment(head)
  if carry > 0
    node = ListNode.new(carry)
    node.next = head
    head = node
  end
  head
end
