# Definition for binary tree with next pointer.
class TreeLinkNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.next = None

class Solution:
    # @param root, a tree link node
    # @return nothing
    def get_next(self, node, parent):
        while parent:
            if parent.left and (node == None or parent.left != node and parent.right != node):
                return parent.left, parent
            elif parent.right and (node == None or parent.right != node):
                return parent.right, parent
            else:
                parent = parent.next
        return None, None

    def connect(self, root, parent = None):
        if not root:
            return
        if parent:
            node = root
            while node:
                next_node, parent = self.get_next(node, parent)
                node.next = next_node
                node = next_node

        next_child, next_parent = self.get_next(None, root)
        self.connect(next_child, next_parent)


node = TreeLinkNode(1)
node.left = TreeLinkNode(2)
node.left.left = TreeLinkNode(4)
node.right = TreeLinkNode(3)
node.right.right = TreeLinkNode(5)

print Solution().connect(node)
print node.left.left.next.val
