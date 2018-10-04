# https://leetcode.com/problems/flatten-2d-vector/

class Vector2D
  # @param {Integer[][]} vec2d
  attr_accessor :row, :col, :vec2d
  def initialize(vec2d)
    self.vec2d = vec2d
    self.row = 0
    self.col = 0
    skip_empty_lists
  end

  # @return {Boolean}
  def has_next
    row < vec2d.length && col < vec2d[row].length
  end

  # @return {Integer}
  def next
    num = vec2d[row][col]    
    move_iterator
    num
  end

  private
  def move_iterator()
    self.col += 1
    if col >= vec2d[row].length
      self.row += 1
      skip_empty_lists
    end
  end

  def skip_empty_lists
    while row < vec2d.length && vec2d[row].empty?
      self.row += 1
    end
    self.col = 0
  end
end

v = Vector2D.new [
  [],
  [3],
  [4,5,6]
]
while v.has_next
  p v.next
end
