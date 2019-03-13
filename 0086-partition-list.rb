# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  dummy_head = ListNode.new(0)
  dummy_head.next = head
  less_ptr, all_ptr = dummy_head, dummy_head
  while all_ptr && all_ptr.next
    if all_ptr.next.val < x
      if all_ptr != less_ptr
        node = all_ptr.next
        all_ptr.next = node.next
        next_node = less_ptr.next
        less_ptr.next = node
        node.next = next_node
      else
        all_ptr = all_ptr.next
      end
      less_ptr = less_ptr.next
    else
      all_ptr = all_ptr.next
    end    
  end
  dummy_head.next
end

dummy_head = ListNode.new(0)
[1,4,3,2,5,2].reduce(dummy_head) { |tail, val|
  tail.next = ListNode.new(val)
}
head = dummy_head.next
p head

p partition(head, 3)