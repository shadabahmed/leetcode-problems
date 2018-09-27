"""
# Definition for a Node.
class Node(object):
    def __init__(self, val, children):
        self.val = val
        self.children = children
"""
class Solution(object):
  def preorder(self, root):
    res = []
    if not root:
      return res
    traverse_stack = [[root, 0]]
    while len(traverse_stack):
      node, child_idx = traverse_stack.pop()
      if child_idx == 0:
        res.append(node.val)
      if child_idx < len(node.children):
        traverse_stack.append([node, child_idx + 1])
        traverse_stack.append([node.children[child_idx], 0])
    return res