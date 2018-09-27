# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} t
# @return {String}
def tree2str(t)
  return '' if t.nil?
  if t.right
    "#{t.val}(#{tree2str(t.left)})(#{tree2str(t.right)})"
  elsif t.left
    "#{t.val}(#{tree2str(t.left)})"
  else
    "#{t.val}"
  end  
end

root = TreeNode.new(1)
root.left = TreeNode.new 2
root.left.right = TreeNode.new 4
root.right = TreeNode.new 3

p tree2str root

