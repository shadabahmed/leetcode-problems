# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  freq_map, res = Hash.new(0), []  
  nums.each do |num|
    freq_map[num] += 1
  end
  pq = PriorityQueue.new(Proc.new{|x,y| freq_map[x] < freq_map[y]})
  freq_map.keys.each do |num|
    pq.insert(num)
  end
  pq.delete_top while pq.size > k
  res.unshift(pq.delete_top) while !pq.empty?
  res
end

class PriorityQueue
  attr_reader :arr, :comparator
  def initialize(comparator)
    @arr = []
    @comparator = comparator
  end

  def empty?
    arr.empty?
  end

  def size
    arr.size
  end

  def compare(left_idx, right_idx)
    comparator[arr[left_idx], arr[right_idx]]
  end

  def parent(idx)
    (idx - 1)/ 2
  end

  def left_child(idx)
    2*idx + 1
  end

  def right_child(idx)
    2*idx + 2
  end

  def heapify_up(idx)
    return if idx.zero?
    parent_idx = parent(idx)
    if compare(idx, parent_idx)
      arr[parent_idx], arr[idx] = arr[idx], arr[parent_idx]
      heapify_up(parent_idx)
    end
  end

  def heapify_down(idx)
    return if idx >= arr.size
    top_idx = idx    
    left_child_idx = left_child(idx)
    right_child_idx = right_child(idx)
    
    top_idx = left_child_idx if left_child_idx < arr.size && compare(left_child_idx, top_idx)
    top_idx = right_child_idx if right_child_idx < arr.size && compare(right_child_idx, top_idx)
    
    if top_idx != idx
      arr[idx], arr[top_idx] = arr[top_idx], arr[idx]
      heapify_down(top_idx)
    end
  end

  def insert(key)
    @arr << key
    heapify_up(arr.size - 1)
  end

  def delete_top()
    return nil if empty?
    arr[0], arr[arr.size - 1] = arr[arr.size - 1], arr[0]
    top = arr.pop
    heapify_down(0)
    top
  end
end

#p top_k_frequent nums = [1,1,1,2,2,3], k = 2
# p top_k_frequent [4,1,-1,2,-1,2,3], 2
p top_k_frequent [5,3,1,1,1,3,73,1], 1