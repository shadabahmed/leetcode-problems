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

# @param {Integer[]} a
# @return {Integer}
def sum_subarray_mins(a)
  pq = PriorityQueue.new { |a, b| a < b }
  total = 0
  a.each { |num| pq.insert(num) }
  a.length.downto(1) do |len|
  end
end

MAX = 1_000_000_007
def sum_subarray_mins(a)
  total = a.sum
  1.upto(a.length - 1) do |len|
    start = 0
    last = a.length - 1 - len
    while start <= last
      a[start] = [a[start], a[start + 1]].min
      total += a[start]
      start += 1      
    end    
  end
  total % MAX
end

MAX = 1_000_000_007
def sum_subarray_mins(a)
  total = 0
  while !a.empty?
    min = a.last
    (a.length - 1).downto(0) do |idx|
      min = a[idx] if min > a[idx]
      total += min
    end
    a.pop    
  end
  total % MAX
end

p sum_subarray_mins [3, 1, 2, 4]

# [3, 1, 1, 1]
# [0, 1, 1, 1]
# [0, 0, 2, 2]
# [0, 0, 0, 4]
# 17
