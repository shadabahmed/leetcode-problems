# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

class Tree
  def self.create(arr, idx = 0)
    return nil if idx >= arr.length || arr[idx].nil?
    node = TreeNode.new(arr[idx])
    node.left = Tree.create(arr, 2 * idx + 1)
    node.right = Tree.create(arr, 2 * idx + 2)
    node
  end
end

# @param {TreeNode} root
# @return {Integer}
def width_of_binary_tree(root)
  prev_level = -1
  max_width = 0
  queue = [[root, 0, 1]]
  while !queue.empty?
    node, level, col = queue.shift
    if level != prev_level
      current_level_width = queue.empty? ? 1 : queue.last.last - col + 1
      max_width = current_level_width if current_level_width > max_width
      prev_level = level
    end
    queue.push([node.left, level + 1, 2 * col]) if node.left
    queue.push([node.right, level + 1, 2 * col + 1]) if node.right
  end
  max_width
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.left = TreeNode.new(4)
root.right.right = TreeNode.new(5)
root.left.left.left = TreeNode.new(6)
root.right.right.right = TreeNode.new(7)
p width_of_binary_tree root

# p width_of_binary_tree(Tree.create([1,1,1,1,1,1,1,nil,nil,nil,1,nil,nil,nil,nil,2,2,2,2,2,2,2,nil,2,nil,nil,2,nil,2]))
 

# require 'graphviz'

# def print_tree(root)
#   g = GraphViz.new(:G, :type => :'strict digraph', :ordering =>"out")
#   queue = [root]
#   until queue.empty?
#     root = queue.shift
#     next unless root
#     #root_node = g.find_node(root.object_id.to_s)
#     root_node = g.add_nodes(root.object_id.to_s, label: root.val)
#     [[root.left, "l  "], [root.right, "  r"]].each do |child, label|
#       if child
#         child_node = g.add_nodes(child.object_id.to_s, label: child.val)
#         g.add_edges(root_node, child_node, :label => label, :sametail => '1')
#         queue << child
#       end
#     end
#   end
#   g.output(pdf: "tree.pdf")
# end

# print_tree(Tree.create([1,1,1,1,1,1,1,nil,nil,nil,1,nil,nil,nil,nil,2,2,2,2,2,2,2,nil,2,nil,nil,2,nil,2]))
