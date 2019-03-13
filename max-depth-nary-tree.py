"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def maxDepth(self, root):
        """
        :type root: Node
        :rtype: int
        """
        max_depth = 0
        if root is None:
          return 0
        for child in self.children:
          child_depth = self.maxDepth(child)
          if child_depth > max_depth:
            max_depth = child_depth
        return max_depth + 1