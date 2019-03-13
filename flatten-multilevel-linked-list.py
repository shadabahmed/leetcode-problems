class Solution(object):
    def flatten(self, head):
        orig_head = head
        next_node = head.next
        while next_node and not head.child:
            head = next_node
            next_node = next_node.next
        if head.child:
            head = flatten(head.child)
