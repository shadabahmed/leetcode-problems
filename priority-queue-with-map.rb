class PriorityQueue
  attr_accessor :arr, :comparator, :map
  def initialize(&block)
    self.map = {}
    self.arr = []
    self.comparator = block
  end

  def compare(first_idx, other_idx)
    comparator.call(arr[first_idx], arr[other_idx])
  end

  def swap(first_idx, other_idx)
    map[arr[first_idx]] = other_idx
    map[arr[other_idx]] = first_idx
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
    map[item] = arr.length
    arr << item
    heapify_up(arr.size - 1)
  end

  def delete_top
    last = arr.pop
    if !arr.empty?
      top = arr[0]
      arr[0] = last
      map[arr[0]] = 0
      heapify_down(0)
      top
    else
      last
    end    
  end

  def delete_key(key)
    idx = map[key]
    swap(idx, arr.length - 1)
    map.delete(key)
    arr.pop
    heapify_down(idx)
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

# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  pq = PriorityQueue.new{|idx1, idx2| buildings[idx1][2] >= buildings[idx2][2]}
  critical_points = []
  res = []
  buildings.each_with_index do |(left, right, _), index|
    critical_points << [left, 1, index]
    critical_points << [right, -1, index]
  end
  critical_points.sort_by!{|c| c[0] - c[1]}
  critical_points.each do |point, start, index|
    if start == 1           
      pq.insert(index)
      res << [point, height(buildings, pq.top)]
    else
      pq.delete_key(index)            
      if pq.empty? 
        res << [point, 0]
      elsif height(buildings, pq.top) < height(buildings, index)
        res << [point, height(buildings, pq.top)]
      end            
    end
  end
  new_res = []
  0.upto(res.length - 1) do |idx|    
    if (idx == res.length - 1 || res[idx][0] != res[idx + 1][0]) && (new_res.empty? || new_res.last.last != res[idx].last)
      new_res.push(res[idx])
    end
  end
  new_res
end

def height(buildings, idx)
  buildings[idx][2]
end

p get_skyline [[2,4,7],[2,4,5],[2,4,6]]

p get_skyline [[1,5,3], [1,5,3], [1,5,3]]
p get_skyline [[0,2,3],[2,5,3]]


buildings = [[2,9,10],[3,7,15],[5,12,12],[15,20,10],[19,24,8]]
p get_skyline(buildings)
buildings = [[0,5,7],[5,10,7],[5,10,12],[10,15,7],[15,20,7],[15,20,12],[20,25,7]]
p get_skyline(buildings)
buildings = [[0,2147483647,2147483647]]
p get_skyline(buildings)
buildings = [[1,2,1],[1,2,2],[1,2,3]]
p get_skyline(buildings)
p get_skyline [[0,2,3],[2,5,3]]

#[[0,7],[5,12],[10,7],[15,12],[20,7],[25,0]]
#p get_skyline buildings