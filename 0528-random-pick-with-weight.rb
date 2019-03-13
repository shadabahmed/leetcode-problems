class Solution
  attr_accessor :w
  def initialize(w)
    self.w = w
    1.upto(w.length - 1) do |idx|
      w[idx] += w[idx - 1]
    end
  end

  def pick_index
    pick = rand(1..w[-1])
    left = 0
    right = w.length - 1
    while left < right
      mid = (left + right) / 2
      if pick > w[mid]
        left = mid + 1
      else
        right = mid
      end
    end
    left
  end
end

# Your Solution object will be instantiated and called as such:
obj = Solution.new([3, 14, 1, 7])
p obj.w
100.times do 
  p obj.pick_index
end

