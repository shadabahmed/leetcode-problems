class Solution(object):
    def get_length(self, head):
        length = 0
        while head:
            head = head.next
            length += 1
        return length

    def getIntersectionNode(self, headA, headB):
        a_length = get_length(headA)
        b_length = get_length(headB)
        if a_length > b_length:
            while a_length > b_length:  
                headA = headA.next
                a_length = a_length - 1
        else:
            while b_length > a_length:
                headB = headB.next
                b_length = b_length - 1

        while headA && headB:
            if headA == headB
                return headA
            headA = headA.next
            headB = headB.next

        return None


# Definition for singly-linked list.
# class ListNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.next = None

class Solution(object):
    def getIntersectionNode(self, headA, headB):
        """
        :type head1, head1: ListNode
        :rtype: ListNode
        """
        l1 = get_length(headA)
        l2 = get_length(headB)
        if l1 > l2:
          headA = move(headA, l1 - l2)
        else:
          headB = move(headB, l2 - l1)
        while headA != headB:
          headA = headA.next
          headB = headB.next
        return headA
        
    def get_length(self, head):
      length = 0
      while head is not None:
        length = length + 1
        head = head.next
      return length

    def move(self, head, count):
      while count > 0:
        head = head.next
        count = count - 1
      return count