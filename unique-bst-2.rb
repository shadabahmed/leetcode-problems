class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees_helper(n, first)
  return [nil] if n < first
  res = []
  first.upto(n) do |root_val|
    generate_trees_helper(root_val - 1, first).each do |left_subtree|
      generate_trees_helper(n, root_val + 1).each do |right_subtree|
        root = TreeNode.new(root_val)
        root.left = left_subtree
        root.right = right_subtree
        res.push(root)
      end
    end
  end
  res
end

def generate_trees(n)
  return [] if n == 0
  generate_trees_helper(n, 1)
end

generate_trees(3)
