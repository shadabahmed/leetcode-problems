class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @return {ListNode}

def get_node_val_end(node)
  return if node.nil?
  while node.next && node.val == node.next.val
    node = node.next
  end
  node
end

def delete_duplicates(head)
  return if head.nil?
  dummy_head = ListNode.new(0)
  prev = dummy_head
  while head
    head_end = get_node_val_end(head)
    if head != head_end
      head = head_end.next
    else
      prev.next = head
      prev = head
      head = head.next
    end
  end
  prev.next = nil
  dummy_head.next
end

head = ListNode.new(1)
head.next = ListNode.new(2)
head.next.next = ListNode.new(2)
head.next.next.next = ListNode.new(3)

delete_duplicates(head)
