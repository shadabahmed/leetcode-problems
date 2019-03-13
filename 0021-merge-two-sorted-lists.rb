# https://leetcode.com/problems/merge-two-sorted-lists/

def merge_two_lists(left, right)
  head = tail = ListNode.new(0)
  while left && right
    if left.val <= right.val
      tail.next = left
      left = left.next
    else
      tail.next = right
      right = right.next
    end
    tail = tail.next
  end

  if left
    tail.next = left
  end

  if right
    tail.next = right
  end

  head.next
end
