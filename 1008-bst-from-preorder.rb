class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end


# @param {Integer[]} preorder
# @return {TreeNode}
def bst_from_preorder(preorder, start = 0, last = preorder.length - 1)
  return false if start > last || start >= preorder.length
  root = TreeNode.new(preorder[start])
  partition = start
  partition += 1 while partition < last && preorder[partition + 1] < preorder[start]
  root.left = bst_from_preorder(preorder, start + 1, partition) if partition > start
  root.right = bst_from_preorder(preorder, partition + 1, last) if partition <= last
  root
end

p bst_from_preorder [8,5,1,7,10,12]