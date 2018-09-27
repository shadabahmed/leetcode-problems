# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# @param {TreeNode} root
# @return {Integer[][]}
def vertical_order_r(root, level = 0, res = {})
  return res if root.nil?
  res[level] ||= []
  vertical_order_r(root.left, level - 1, res)
  vertical_order_r(root.right, level + 1, res)
  res[level].unshift(root.val)
  res
end

def vertical_order(root)
  return [] if root.nil?
  res = vertical_order_r(root)
  res.keys.sort.collect{|k| r[k]}
end


def vertical_order(root)
  queue, res = [[root, 0]], {}
  min, max = 0, 0
  while !queue.empty?
    node, col = queue.shift
    res[col] ||= []
    res[col].push(node.val)
    min = col if col < min
    max = col if col > max
    queue.push([node.left, col - 1]) if node.left
    queue.push([node.right, col + 1]) if node.right
  end
  min.upto(max).collect{|col| res[col]}
end
