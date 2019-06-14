# Definition for a undirected graph node
# class UndirectedGraphNode:
#     def __init__(self, x):
#         self.label = x
#         self.neighbors = []


class Solution:
  # @param node, a undirected graph node
  # @return a undirected graph node
  def cloneGraph(self, node, node_map = {}):
    if not node:
      return None
    clone_node = UndirectedGraphNode(node.label)
    node_map[node] = clone_node
    for neighbor in node.neighbors:
      if neighbor in node_map:
        clone_node.neighbors.append(node_map[neighbor])
      else:
        clone_node.neighbors.append(self.cloneGraph(neighbor, node_map))
    return clone_node  
