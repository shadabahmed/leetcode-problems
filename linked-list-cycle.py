class Solution(object):
    def hasCycle(self, head):
        if not head:
            return false
        slow = head
        fast = head.next
        while slow and fast and fast.next and slow != fast:
            slow = slow.next
            fast = fast.next.next
        slow = slow.next
        while head and slow and head != slow:
            head = head.next
            slow = slow.next
        return slow is not None

        """
        :type head: ListNode
        :rtype: bool
        """

class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

head = ListNode(1)
head.next = ListNode(2)
head.next.next = ListNode(3)
head.next.next.next = ListNode(4)
#print Solution().hasCycle(head)

head.next.next.next.next = head.next
print Solution().hasCycle(head)
