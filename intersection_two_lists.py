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
