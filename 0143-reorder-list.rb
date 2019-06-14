# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  arr = []
  while head
    arr << head
    head = head.next
  end
  head = arr.first
  while !arr.empty?
    first = arr.shift
    last = arr.pop
    first.next = last
    last.next = arr.first if last    
  end
  head
end