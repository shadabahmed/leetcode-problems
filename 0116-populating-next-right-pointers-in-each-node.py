# Definition for binary tree with next pointer.
class TreeLinkNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
        self.next = None

class Solution:
    def connect(self, root):
        if not root:
            return
        if root.left:
            root.left.next = root.right
            self.connect(root.left)
        if root.right:
            if root.next:
                root.right.next = root.next.left
            self.connect(root.right)



node = TreeLinkNode(1)
node.left = TreeLinkNode(2)
node.right = TreeLinkNode(3)

print Solution().connect(node)
print node.left.next.val
