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
    return if idx >= size
    parent_idx = parent(idx)
    if compare(idx, parent_idx)
      swap(idx, parent_idx)
      heapify_up(parent_idx)
    end
  end

  def heapify_down(idx)
    return if idx >= size
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
    self.lq = PriorityQueue.new { |a, b| a > b }
    self.hq = PriorityQueue.new { |a, b| a < b }
  end

  # :type num: Integer
  # :rtype: Void
  def add_num(num)
    # binding.pry if lq.size == 19
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

class HitCounter
  #     Initialize your data structure here.
  attr_accessor :timestamp_map, :min_heap, :total, :window
  def initialize(_window = 300)
    self.min_heap = PriorityQueue.new { |a, b| a < b }
    self.timestamp_map = {}
    self.total = 0
    self.window = 300
  end

  #   Record a hit.
  #   @param timestamp - The current timestamp (in seconds granularity).
  #   :type timestamp: Integer
  #   :rtype: Void
  def hit(timestamp)
    if timestamp_map.key?(timestamp)
      timestamp_map[timestamp] += 1
    else
      clear_expired_hits(timestamp)
      min_heap.insert(timestamp)
      timestamp_map[timestamp] = 1
    end
    self.total += 1
  end

  #   Return the number of hits in the past 5 minutes.
  #   @param timestamp - The current timestamp (in seconds granularity).
  #   :type timestamp: Integer
  #   :rtype: Integer
  def get_hits(timestamp)
    clear_expired_hits(timestamp)
    self.total
  end

  def clear_expired_hits(timestamp)
    while !min_heap.empty? && timestamp - min_heap.top >= window
      self.total -= timestamp_map.delete(min_heap.delete_top)
    end
  end
end

# Your HitCounter object will be instantiated and called as such:
# obj = HitCounter.new()
# obj.hit(timestamp)
# param_2 = obj.get_hits(timestamp)


counter = HitCounter.new();

# hit at timestamp 1.
counter.hit(1);
counter.hit(1);

# hit at timestamp 2.
counter.hit(2);

# hit at timestamp 3.
counter.hit(3);

# get hits at timestamp 4, should return 3.
p counter.get_hits(4);

# hit at timestamp 300.
counter.hit(300);
counter.hit(300);

# get hits at timestamp 300, should return 4.
p counter.get_hits(300);

# get hits at timestamp 301, should return 3.
p counter.get_hits(301); 