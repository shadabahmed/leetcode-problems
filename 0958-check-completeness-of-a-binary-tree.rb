# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}
def is_complete_tree(root)
  nodes = []
  nodes = [[root, 0]]
  i = 0 
  while i < nodes.length
    node, number = nodes[i]
    i += 1
    if node
      nodes << [node.left, 2 * i]
      nodes << [node.right, 2 * i + 1]
    end
  end
  nodes.last.last == nodes.length
end

def is_complete_tree(root)
  nodes = [[root, 1]]
  i = 0 
  while i < nodes.length
    node, number = nodes[i]
    i += 1
    if node
      nodes << [node.left, 2 * i] if node.left
      nodes << [node.right, 2 * i + 1] if node.right
    end
  end
  nodes.last.last == nodes.length
end

root = TreeNode.new(1)
root.left = TreeNode.new(1)
root.left.left = TreeNode.new(1)
root.left.right = TreeNode.new(1)
root.right = TreeNode.new(1)
#root.right.left = TreeNode.new(1)
root.right.right = TreeNode.new(1)

p is_complete_tree root