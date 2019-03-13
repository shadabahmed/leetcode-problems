"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
  def postorder(self, root):
    res = []
    if not root:
      return res
    traverse_stack = [root]
    while len(traverse_stack):
      node = traverse_stack.pop()
      res.insert(0, node.val)
      for child in node.children:
        traverse_stack.append(child)
    return res