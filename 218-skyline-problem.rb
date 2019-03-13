INF = 1.0 / 0

# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  tree = Tree.new
  buildings
  .sort{|a, b| b[2] <=> a[2]}
  .each do |a|
    tree.insert(*a)
  end
  tree.get_points  
end

class Tree
  class Node
    attr_accessor :left_child, :right_child, :left, :right, :height
    def initialize(left, right, height)
      self.left = left
      self.right = right
      self.height = height
    end
  end

  attr_accessor :root
  def initialize
    self.root = nil
  end

  def insert(left, right, height)
    self.root = insert_node(left, right, height)
  end

  def insert_node(left, right, height, node = root)
    return Node.new(left, right, height) if node.nil?
    if left < node.left
      if height == node.height && right >= node.left
        node.left = left
      else
        node.left_child = insert_node(left, [node.left, right].min, height, node.left_child)
      end      
    end
    if right > node.right
      if height == node.height && left <= node.right
        node.right = right
      else
        node.right_child = insert_node([left, node.right].max, right, height, node.right_child)
      end      
    end
    node
  end

  def get_points()
    stack = []
    inorder_nodes = []
    res = []
    node = root
    while !stack.empty? || node
      while node
        stack.push(node)
        node = node.left_child
      end
      node = stack.pop
      inorder_nodes.push(node)
      node = node.right_child
    end
    inorder_nodes.push(Node.new(INF, INF, 0))
    0.upto(inorder_nodes.length - 2) do |idx|
      current = inorder_nodes[idx]
      next_building = inorder_nodes[idx + 1]
      res << [current.left, current.height]
      if current.right < next_building.left
        res << [current.right, 0]
      end
    end
    res
  end
end


buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]
#buildings = []
#buildings = [[0,2,3],[2,5,3]]

buildings = [[0,5,7],[5,10,7],[5,10,12],[10,15,7],[15,20,7],[15,20,12],[20,25,7]]
buildings = [[0,2147483647,2147483647]]
p get_skyline(buildings)

#[[0,7],[5,12],[10,7],[15,12],[20,7],[25,0]]