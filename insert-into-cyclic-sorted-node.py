class Solution(object):
    def insert(self, head, insertVal):
        if not head:
            node = Node(insertVal, None)
            node.next = node
            return node
        orig_head = head
        prev = head
        while head != orig_head:
            prev = head
            head = head.next
            if prev.val <= insertVal and head.val >= insertVal:
                break
        prev.next = Node(insertVal, head)
        return orig_head
