# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root)
  res = []
  queue = [[root, find_left_breadth(root).abs, 0]]
  while !queue.empty?
    node, level, depth = queue.shift
    res[level] ||= {}
    res[level][depth] ||= []
    res[level][depth] << node.val
    queue << [node.left, level - 1, depth + 1] if node.left
    queue << [node.right, level + 1, depth + 1] if node.right
  end
  res
end

def flatten(res)

end

def find_left_breadth(root, level = 0)
  min = level
  if root.left
    left_min = find_left_breadth(root.left, level - 1)
    min = left_min if left_min < min
  end
  if root.right
    right_min = find_left_breadth(root.right, level + 1)
    min = right_min if right_min < min
  end
  min
end


# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root, depth = 0, level = 0, map = {})
  map = {}
  traverse(root, 0, 0, map)
  flatten(map)
end

def traverse(root, depth, level, map)
  return if root.nil?
  traverse(root.left, depth + 1, level - 1, map)
  map[level] ||= []
  map[level][depth] ||= []  
  map[level][depth] << root.val
  traverse(root.right, depth + 1, level + 1, map)
end

def flatten(map)
  keys = map.keys.sort
  res = []
  keys.sort.each do |level|
    current = []
    map[level].each do |val|
      next if val.nil?
      current += val.sort
    end
    res << current
  end
  res
end

root = TreeNode.new(3)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.left.right = TreeNode.new(7)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)
p vertical_traversal root

