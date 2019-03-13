import json

class RandomListNode(object):
    def __init__(self, x):
        self.label = x
        self.next = None
        self.random = None

class Solution(object):

    def fix_random(self, head):
      head = head.next
      while head:
        if head.random:
          head.random = head.random.next
        head = head.next
        if head:
          head = head.next

    def detach_clone(self, head):
      clone_head = head.next
      while head:
        clone = head.next
        head.next = clone.next
        if head.next:
          clone.next = head.next.next
        head = head.next
      return clone_head


    def attach_clone(self, head):
        tail = head
        while tail is not None:
            clone = RandomListNode(tail.label);
            clone.random = tail.random
            clone.next = tail.next
            tail.next = clone
            tail = clone.next
        return head

    def copyRandomList(self, head):
        self.attach_clone(head)
        self.fix_random(head)
        return self.detach_clone(head)

head = RandomListNode('-1')
head.next = RandomListNode('#')
print head.label
print head.next.label
print id(head)
print id(head.next)
print head.next.next
clone = Solution().copyRandomList(head)


print head.label
print head.next.label
print id(head)
print id(head.next)
print head.next.next


print clone.label
print clone.next.label
print id(clone)
print id(clone.next)
print clone.next.next
