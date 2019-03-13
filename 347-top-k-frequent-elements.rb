# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
require "set"

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

def top_k_frequent(nums, k)
  nums_map = Hash.new(0)
  freq_map = {}
  nums.each do |num|
    nums_map[num] += 1
    if nums_map[num] > 1
      freq_map[nums_map[num] - 1].delete(num)
    end
    freq_map[nums_map[num]] ||= Set.new
    freq_map[nums_map[num]].add(num)
  end
  res = []
  nums.size.downto(1) do |n|
    if freq_map[n]
      freq_map[n].each do |num|
        res.push(num)
        return res if res.size == k
      end
    end
  end
  res
end

def top_k_frequent(nums, k)
  freq_map = Hash.new(0)
  pq = PriorityQueue.new {|a,b| freq_map[a] < freq_map[b]}
  nums.each do |num|
    freq_map[num] += 1
  end
  freq_map.each do |(num, _)|
    pq.insert(num)
  end
  while pq.size > k
    pq.delete_top
  end
  pq.arr
end

p top_k_frequent [1, 1, 1, 2, 2, 3], 2
p top_k_frequent [1], 1
