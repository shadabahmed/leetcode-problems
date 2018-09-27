def swap_adjacent_nodes(first, mid, last)
  first.next = last
  mid.next = last.next
  last.next = mid
end

def swap_nodes(left, right)
  return if left == right
  if left.next == right
    swap_adjacent_nodes(left, right, right.next)
  else
    left.next, right.next = right.next, left.next
    left.next.next, right.next.next = right.next.next, left.next.next
  end
end

def insert_node(left, right)
  return if left == right
  right_node = right.next
  right.next = right_node.next
  right_node.next = left.next
  left.next = right_node
end

def partition(head, x)
  dummy_head = ListNode.new(0)
  dummy_head.next = head
  low = prev = dummy_head
  high = head
  while high
    if high.val < x
      insert_node(low, prev)
      low = low.next
    end
    prev = high
    high = high.next
  end
  dummy_head.next
end
