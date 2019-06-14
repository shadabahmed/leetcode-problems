class PQ
  attr_accessor :arr, :comparator
  def initialize(&comparator)
    self.arr = []
    self.comparator = comparator
  end

  def compare(idx, other_idx)
    comparator[arr[idx], arr[other_idx]]
  end

  def swap(idx, swap_idx)
    arr[idx], arr[swap_idx] = arr[swap_idx], arr[idx]
  end

  def parent(idx)
    (idx - 1) / 2
  end

  def left(idx)
    idx * 2 + 1
  end

  def right(idx)
    idx * 2 + 2
  end

  def heapify_up(idx)
    parent_idx = parent(idx)
    if parent_idx > 0 && compare(idx, parent_idx)
      swap(idx, parent_idx)
      heapify_up(parent_idx)
    end
  end

  def heapify_down(idx)
    min_idx = idx
    left_idx = left(idx)
    right_idx = right(idx)
    if left_idx < arr.size && compare(left_idx, min_idx)
      min_idx = left_idx
    end

    if right_idx < arr.size && compare(right_idx, min_idx)
      min_idx = right_idx
    end

    if min_idx != idx
      swap(min_idx, idx)
      heapify_down(min_idx)
    end
  end

  def insert(val)
    arr.push(val)
    heapify_up(arr.size - 1)
  end

  def top()
    return if empty?
    arr.first
  end

  def remove_top()
    return if empty?
    swap(0, arr.length - 1)
    first = arr.pop
    heapify_down(0)
    first
  end

  def empty?
    arr.empty?
  end

  def size
    arr.size
  end
end

def nth_super_ugly_number(n, primes)
  pq = PQ.new {|x,y| x < y}
  inserted = {}
  pq.insert(1)
  while n > 1
    min = pq.remove_top
    inserted.delete(min)
    primes.each do |multiplier|
      num = multiplier * min
      pq.insert(num) unless inserted.key?(num)
      inserted[num] = true
    end
    n -= 1
  end
  pq.top
end

p nth_super_ugly_number  n = 12, primes = [2,7,13,19]