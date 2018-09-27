def kth_from_last(head, k)
  orig_head, orig_k, count = head, k, 1
  while k > 1
    head = head.next
    k -= 1
    if head.nil?
      head = orig_head
      k = orig_k % count
    end
    count += 1
  end
  while head.next
    head = head.next
    orig_head = orig_head.next
  end
  orig_head
end

def rotate_right(head, k)
  return head if head.nil? || k == 0
  kth_last_prev = kth_from_last(head, k + 1)
  last = kth_from_last(head, 1)
  if kth_last_prev != last
    new_head = kth_last_prev.next
    kth_last_prev.next = nil
    last.next = head
    new_head
  else
    new_head = head.next
    kth_last_prev.next = head
    head.next = nil
    new_head
  end
end



def get_length(head)
  length = 1
  while head.next
    head = head.next
    length += 1
  end
  length
end

def get_kth_node(head, k)
  while k > 1
    head = head.next
    k -= 1
  end
  head
end

def rotate_right(head, k)
  return head if k == 0 || head.nil?
  length = get_length(head)
  k = length - k % length
  k += length if k < 0
  last = get_kth_node(head, length)
  last.next = head
  kth_prev = get_kth_node(head, k)
  new_head = kth_prev.next
  kth_prev.next = nil
  new_head
end


class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

h = ListNode.new(1)
h.next = ListNode.new(2)
# h.next.next = ListNode.new(3)
# h.next.next.next = ListNode.new(4)
# h.next.next.next.next = ListNode.new(5)
#p rotate_right(h, 2)
p rotate_right(h, 4)
#p kth_from_last(h, 5)
# p kth_from_last(h, 4)
