
# Definition for a undirected graph node
class UndirectedGraphNode:
  def __init__(self, x):
    self.label = x
    self.neighbors = []

class Solution:
  # @param node, a undirected graph node
  # @return a undirected graph node
  def cloneGraph(self, node, visited = Set()):
    if not node:
      return None
    clone_node = UndirectedGraphNode(node.label)
    visited.add(node)
    for neighbor in node.neighbors:
      if neighbor not in visited:
        clone_node.neighbors.append(self.cloneGraph(neighbor, visited))
    return clone_node  

 if __name__ == "__main__":
  first = UndirectedGraphNode(1)
  second = UndirectedGraphNode(0)   
  third = UndirectedGraphNode(2)

  first.neighbors.append(second)
  first.neighbors.append(third)

  second.neighbors.append(first)
  second.neighbors.append(third)

  third.neighbors.append(first)
  second.neighbors.append(second)
  thid.neighbors.append(third)

  print first