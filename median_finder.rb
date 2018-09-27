class PriorityQueue
  attr_accessor :arr, :comparator
  def initialize(&block)
    self.arr = []
    self.comparator = block
  end

  def compare(first_idx, other_idx)
    comparator.call(arr[first_idx], arr[other_idx])
  end

  def swap(first_idx, other_idx)
    arr[first_idx], arr[other_idx] = arr[other_idx], arr[first_idx]
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def left(idx)
    2 * idx + 1
  end

  def right(idx)
    2 * idx + 2
  end

  def heapify_up(idx)
    return if idx >= size || idx.zero?
    parent_idx = parent(idx)
    if compare(idx, parent_idx)
      swap(idx, parent_idx)
      heapify_up(parent_idx)
    end
  end

  def heapify_down(idx)
    return if idx >= size || idx < 0
    left_idx = left(idx)
    right_idx = right(idx)
    priority_idx = idx
    priority_idx = left_idx if left_idx < size && compare(left_idx, priority_idx)
    priority_idx = right_idx if right_idx < size && compare(right_idx, priority_idx)
    if priority_idx != idx
      swap(idx, priority_idx)
      heapify_down(priority_idx)
    end
  end

  def insert(item)
    arr << item
    heapify_up(arr.size - 1)
  end

  def delete_top
    last = arr.pop
    if !arr.empty?
      top = arr[0]
      arr[0] = last
      heapify_down(0)
      top
    else
      last
    end    
  end

  def top
    arr[0]
  end

  def size
    arr.size
  end

  def empty?
    arr.empty?
  end
end

class MedianFinder
  attr_accessor :lq, :hq
  # initialize your data structure here.
  def initialize
    @lq = PriorityQueue.new {|a,b| a > b}
    @hq = PriorityQueue.new {|a,b| a < b}
  end

  # :type num: Integer
  # :rtype: Void
  def add_num(num)
    #binding.pry if lq.size == 19
    if lq.empty? || num <= lq.top
      lq.insert(num)
    else
      hq.insert(num)
    end
    if lq.size > hq.size + 1
      hq.insert(lq.delete_top)
    elsif hq.size > lq.size
      lq.insert(hq.delete_top)
    end    
  end

  #     :rtype: Float
  def find_median
    return nil if lq.empty? && hq.empty?
    if lq.size == hq.size
      (lq.top + hq.top) / 2.0
    else
      lq.top
    end    
  end
end
# Your MedianFinder object will be instantiated and called as such:

# obj.add_num(1)
# obj.add_num(2)
# p obj.find_median()
# obj.add_num(3)
# p obj.find_median()
# obj.add_num(4)
# obj.add_num(5)
# p obj.find_median()

null = nil
output   = [null,null,78.0,null,46.0,null,50.0,null,35.0,null,20.0,null,17.0,null,20.0,null,17.0,null,14.0,null,17.0,null,20.0,null,22.5,null,25.0,null,27.0,null,25.0,null,22.5,null,25.0,null,24.0,null,25.0,null,27.0,null,25.0,null,27.0,null,29.0,null,29.0,null,29.0,null,27.0,null,29.0,null,27.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,27.0,null,25.0,null,27.0,null,25.0,null,27.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,30.0,null,31.0,null,32.0,null,31.0,null,30.0,null,31.0,null,30.0,null,29.0,null,30.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0]
expected = [null,null,78.0,null,46.0,null,50.0,null,35.0,null,20.0,null,17.0,null,20.0,null,17.0,null,14.0,null,17.0,null,20.0,null,22.5,null,25.0,null,27.0,null,25.0,null,22.5,null,25.0,null,24.0,null,25.0,null,27.0,null,25.0,null,27.0,null,29.0,null,29.0,null,29.0,null,27.0,null,29.0,null,27.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,30.0,null,31.0,null,32.0,null,31.0,null,30.0,null,31.0,null,30.0,null,29.0,null,30.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0,null,29.0]

commands = ["MedianFinder","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian","addNum","findMedian"]
inputs = [[],[78],[],[14],[],[50],[],[20],[],[13],[],[9],[],[25],[],[8],[],[13],[],[37],[],[29],[],[33],[],[55],[],[52],[],[6],[],[17],[],[65],[],[23],[],[74],[],[43],[],[5],[],[29],[],[29],[],[72],[],[7],[],[13],[],[56],[],[21],[],[31],[],[66],[],[69],[],[69],[],[74],[],[12],[],[77],[],[23],[],[10],[],[6],[],[27],[],[63],[],[77],[],[21],[],[40],[],[10],[],[19],[],[59],[],[35],[],[40],[],[44],[],[4],[],[15],[],[29],[],[63],[],[27],[],[46],[],[56],[],[0],[],[60],[],[72],[],[35],[],[54],[],[50],[],[14],[],[29],[],[62],[],[24],[],[18],[],[79],[],[16],[],[19],[],[8],[],[77],[],[10],[],[21],[],[66],[],[42],[],[76],[],[14],[],[58],[],[20],[],[0],[]]
obj = MedianFinder.new()
p commands.length
1.upto(commands.length - 1) do |idx|
  p [commands[idx], inputs[idx]]
  p obj.lq.arr        
  p obj.hq.arr        
  
  output = if commands[idx] == "addNum"
            obj.add_num(inputs[idx].first)
            nil
          else
            obj.find_median()
          end
  p obj.lq.arr        
  p obj.hq.arr        
  p [output, expected[idx], idx]
  break if expected[idx] != output         
end