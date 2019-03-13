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
    return if idx >= size || idx <= 0
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

def slide_window(lq, hq, in_num, out_num, del_map, k)
  balance = 0
  del_map[out_num] += 1
  balance += out_num <= lq.top ? -1 : 1
  if lq.empty? || in_num <= lq.top
    lq.insert(in_num)
    balance += 1
  else
    hq.insert(in_num)
    balance -= 1
  end

  

  if balance < 0
    lq.insert(hq.delete_top)
    balance += 1
  end

  if balance > 0
    hq.insert(lq.delete_top)
    balance -= 1
  end

  while del_map.key?(lq.top)
    top = lq.delete_top
    del_map[top] -= 1
    del_map.delete(top) if del_map[top].zero?
  end

  while del_map.key?(hq.top)
    top = hq.delete_top
    del_map[top] -= 1
    del_map.delete(top) if del_map[top].zero?
  end
end

def get_median(lq, hq, k)
  if k % 2 == 0
    (lq.top + hq.top) / 2.0
  else
    lq.top.to_f
  end
end

def insert_into_queues(num, lq, hq)
  if lq.empty? || num <= lq.top
    lq.insert(num)
  else
    hq.insert(num)
  end  
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float[]}
def median_sliding_window(nums, k)
  lq = PriorityQueue.new {|a,b| a > b}
  hq = PriorityQueue.new {|a,b| a < b}
  del_map = Hash.new(0)
  res = []
  0.upto(k - 1) {|idx| lq.insert(nums[idx]) }
  (k/2).times { hq.insert(lq.delete_top) }
  res.push(get_median(lq, hq, k))
  k.upto(nums.size - 1) do |idx|    
    in_num = nums[idx]
    out_num = nums[idx - k]
    slide_window(lq, hq, in_num, out_num, del_map, k)
    res.push(get_median(lq, hq, k))
  end
  res
end

p median_sliding_window([1,3,-1,-3,5,3,6,7],3)
p median_sliding_window [7,8,8,3,8,1,5,3,5,4], 3
p median_sliding_window [6,5,9,5,4,9,1,7,5,5], 4
p median_sliding_window [2147483647,1,2,3,4,5,6,7,2147483647], 2
# [5.5,5.0,7.0,4.5,5.5,6.0,5.0]

#[8.0,8.0,8.0,3.0,5.0,3.0,5.0,4.0]