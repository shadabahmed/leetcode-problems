class Solution(object):
    def flatten(self, head, other_list = None):
        if not head:
            return other_list
        orig_head = head
        while True:
            next_node = head.next
            if head.child:
                flattened_child = self.flatten(head.child, head.next)
                head.next = flattened_child
                flattened_child.prev = head
                head.child = None
            if next_node:
                head = next_node
            else:
                break
        if other_list:
            head.next = other_list
            other_list.prev = head
        return orig_head

    def flatten(self, head, other_list = None):
        if not head:
            return other_list
        orig_head = head
        right_node = nil
        while head:
            next_node = head.next
            if head.child:
                child = head.child
                head.next = child
                child.prev = head
                head.child = None
                while child.next:
                  child = child.next
                if next_node:
                  child.next = next_node
                  next_node.prev = child
            head = head.next
        return orig_head

class Solution(object):
    def flatten(self, head, other_list = None):
        if not head:
            return other_list
        stack = []
        orig_head = head
        while head:
            if head.child:
                if head.next:
                    stack.append(head.next)
                child = head.child
                head.next = child
                child.prev = head
                head.child = None
            if not head.next and len(stack) > 0:
                next_list = stack.pop()
                next_list.prev = head
                head.next = next_list
            head = head.next
        return orig_head

class Solution(object):
    def flatten(self, head, other_head = None):
        if not head:
            return other_head
        orig_head = head
        while head:
            next_node = head.next
            if head.child:
                child = self.flatten(head.child, head.next)
                child.prev = head
                head.next = child
                head.child = None
            if other_head and not next_node:
                other_head.prev = head
                head.next = other_head
            head = next_node

        return orig_head
