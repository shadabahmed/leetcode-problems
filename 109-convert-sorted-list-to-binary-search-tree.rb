# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {ListNode} head
# @return {TreeNode}
def sorted_list_to_bst(head)
  return nil if head.nil?
  return TreeNode.new(head.val) unless head.next
  mid_prev = head
  tail = head.next
  while tail && tail.next && tail.next.next
    tail = tail.next 
    tail = tail.next
    mid_prev = mid_prev.next
  end
  mid = mid_prev.next
  mid_prev.next = nil
  root = TreeNode.new(mid.val)
  root.right = sorted_list_to_bst(mid.next)
  root.left = sorted_list_to_bst(head)
  root
end

require './linked_list'
require './tree'

p sorted_list_to_bst(LinkedList.create([-10,-3,0,5,9]))