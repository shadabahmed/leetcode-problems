"""
# Definition for a Node.
class Node:
    def __init__(self, val, left, right, parent):
        self.val = val
        self.left = left
        self.right = right
        self.parent = parent
"""
class Solution:
    def inorderSuccessor(self, node):
        if node is None:
          return node
        elif node.right is not None:
          suc = node.right
          while suc.left:
            suc = suc.left
          return suc
        elif node.parent:
          suc = node.parent
          while suc.parent and suc == suc.parent.right:
            suc = suc.parent
          return suc
        else:
          return None



Solution().inorderSuccessor(None)