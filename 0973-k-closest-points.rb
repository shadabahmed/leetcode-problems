# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  pq = PriorityQueue.new {|(x1,y1),(x2,y2)| x1 * x1 + y1 * y1 > x2*x2 + y2 * y2}
  points.each do |(x, y)|
    pq.insert([x, y])
  end
  pq.delete_top while pq.size > k
  pq.arr
end

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


p k_closest points = [[1,3],[-2,2]], k = 1