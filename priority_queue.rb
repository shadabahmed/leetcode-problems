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
    idx / 2
  end

  def left_child(idx)
    2 * idx + 1
  end

  def right_child(idx)
    2 * idx + 2
  end

  def heapify_up(idx)
    parent_idx = parent(idx)
    if compare(idx, parent_idx)
      swap(parent_idx, idx)
      heapify_up(parent_idx)
    end
  end

  def heapify_down(idx)
    left_idx = left(idx)
    right_idx = right(idx)
    priority_idx = idx

    priority_idx = left_idx if compare(left_idx, priority_idx)

    priority_idx = right_idx if compare(right_idx, priority_idx)
    if priority_idx != idx
      swap(idx, priority_idx)
      heapify_down(priority_idx)
    end
  end

  def insert(item)
    arr << item
    heapify_up(arr.size - 1)
  end

  def delete_priority_element
    arr[0] = arr.pop
    heapify_down(0)
  end

  def priority_element
    arr[0]
  end
end

pq = PriorityQueue.new { |a, b| a > b }
pq.insert(1)
pq.insert(3)
pq.insert(2)
pq.insert(5)
pq.insert(4)
p pq
