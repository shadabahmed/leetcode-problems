# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  cur = root
  prev = nil
  first, second = nil, nil
  while cur
    if(prev && cur.val <= prev.val)
      first = prev unless first
      second = cur
    end      
    if cur.left
      pred = cur.left
      while pred && pred.right && pred.right != cur
        pred = pred.right
      end
      if pred.right == cur
        pred.right = nil
        prev = cur
        cur = cur.right
      else        
        pred.right = cur
        cur = cur.left
      end
    else
      prev = cur
      cur = cur.right    
    end    
  end
  first.val, second.val = second.val, first.val
  root
end


def inorder_morris(root)
  cur = root
  while cur
    if cur.left
      pred = cur.left
      while pred && pred.right && pred.right != cur
        pred = pred.right
      end
      if pred.right == cur
        pred.right = nil
        puts cur.val
        cur = cur.right
      else
        pred.right = cur
        cur = cur.left if cur.left
      end
    else
      puts cur.val
      cur = cur.right    
    end    
  end
end

require './tree'

root =  Tree.create([1,3,nil,nil,2])
p root
p recover_tree(root)
# root = swap_nodes(root, nil, root.left, root)
# p root