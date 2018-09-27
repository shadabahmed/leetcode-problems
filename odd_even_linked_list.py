class Solution(object):
    def get_odd_tail(self, head):
        while head and head.next and head.next.next:
            head = head.next.next
        return head


    def oddEvenList(self, head):
        if head is None:
            return None
        tail = self.get_odd_tail(head)
        odd_tail = tail
        updated_head = head

        while head != odd_tail:
            even_elem = head.next
            next_head = even_elem.next
            head.next = next_head
            even_elem.next = tail.next
            tail.next = even_elem
            tail = even_elem
            head = next_head
        return updated_head
