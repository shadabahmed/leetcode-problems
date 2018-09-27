"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
    def levelOrder(self, root):
        """
        :type root: Node
        :rtype: List[List[int]]
        """
        res = []
        if not root:
          return res
        queue = [[root, 0]]
        while len(queue):
          node, level = queue.pop(0)
          if level >= len(res):
            res.append([])
          res[level].append(node.val)
          for child in node.children:
            queue.append([child, level + 1])          
        return res