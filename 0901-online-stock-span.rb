class StockSpanner
  attr_accessor :prev
  def initialize()
    self.prev = []   
  end

  def next(price)
    idx = prev.length
    span = 1
    while idx >= 0
      prev_price, prev_span = prev[idx]
      if prev_price <= price
        span += prev_span
        idx -= prev_span
      else
        break
      end
    end
    prev.push([price, span])
    span
  end
end


class StockSpanner
  attr_accessor :stack
  def initialize()
    self.stack = []   
  end

  def next(price)
    span = 1
    while !stack.empty? && stack.last.first <= price
      prev_price, prev_span = stack.pop
      span += prev_span
    end
    stack.push([price, span])
    span
  end
end

# Your StockSpanner object will be instantiated and called as such:
# obj = StockSpanner.new()
# param_1 = obj.next(price)