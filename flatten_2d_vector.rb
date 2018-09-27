class Iterator
  def initialize(collection)
    @iterator = collection&.each
  end

  def next
    return unless @iterator
    begin
      @iterator.next
    rescue StopIteration
      nil
    end
  end

  def has_next
    return false unless @iterator
    begin
      !!@iterator.peek
    rescue StopIteration
      false
    end
  end
end

class Vector2D
  # @param {Integer[][]} vec2d
  attr_accessor :row, :col, :vec2d
  def initialize(vec2d)
    self.vec2d = vec2d
    self.row = 0
    self.col = 0
  end

  # @return {Boolean}
  def has_next
    while self.row < vec2d.size && current_iterator_end?
      move_to_next_iterator
    end
  end

  # @return {Integer}
  def next

  end

  
end
