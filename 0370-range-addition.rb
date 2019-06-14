class SegmentTree
  class Node < Struct.new(:val, :first, :last, :left, :right)
  end
  attr_accessor :root
  def initialize(first, last)
    self.root = Node.new(0, first, last)
  end

  def update(first, last, val, node = root)
    mid = (node.first + node.last) / 2
    if first == node.first && last == node.last
      node.val += val
    elsif last <= mid
      node.left ||= Node.new(0, node.first, mid)
      update(first, last, val, node.left)
    elsif first > mid
      node.right ||= Node.new(0, mid + 1, node.last)
      update(first, last, val, node.right)
    else
      node.left ||= Node.new(0, node.first, mid)
      node.right ||= Node.new(0, mid + 1, node.last)
      update(first, mid, val, node.left)
      update(mid + 1, last, val, node.right)
    end
  end

  def get_final(node = root, prev = 0, res = [])
    mid = (node.first + node.last) / 2
    if node.left
      get_final(node.left, prev + node.val, res)
    else
      node.first.upto(mid) do |idx|
        res[idx] ||= 0
        res[idx] += node.val + prev
      end
    end
    if node.right
      get_final(node.right, prev + node.val, res)
    else
      (mid + 1).upto(node.last) do |idx|
        res[idx] ||= 0
        res[idx] += node.val + prev
      end
    end    
    res
  end
end


# @param {Integer} length
# @param {Integer[][]} updates
# @return {Integer[]}
def get_modified_array(length, updates)
  tree = SegmentTree.new(0, length - 1)
  updates.each {|first, last, val| tree.update(first, last, val)}
  tree.get_final
end

p get_modified_array length = 5, updates = [[1,3,2],[2,4,3],[0,2,-2]]