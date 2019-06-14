# https://leetcode.com/problems/median-of-two-sorted-arrays/

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
# def find_median_sorted_arrays(nums1, nums2)
#   first, last = 0, nums1.length + nums2.length - 1
#   nums1_idx = nums1.length - 1
#   nums2_idx = 0
#   while first <= last
#     mid = (first + last) / 2
#     if mid < nums1.length
#       if nums1[mid] > nums2[nums2_idx]
#         nums1[mid], nums2[nums2_idx] = nums2[nums2_idx], nums1[mid]
#         nums2_idx += 1
#         last = mid - 1
#       else
#         first = mid + 1
#       end
#     else
#       if nums2[mid - nums1.length] < nums1[nums1_idx]
#         nums2[mid], nums1[nums1_idx] = nums1[nums1_idx], nums2[mid]
#         nums1_idx -= 1
#         first = mid + 1
#       else
#         last = mid - 1
#       end
#     end
#   end
#   p nums1, nums2
# end


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

def find_median_sorted_arrays(nums1, nums2)
  pq = PriorityQueue.new {|a,b| a > b }
  idx1, idx2 = 0, 0
  total_size = nums1.size + nums2.size
  max_pq_size = (total_size + 1) / 2
  while pq.size <= max_pq_size
    if idx1 < nums1.length && idx2 < nums2.length
      if nums1[idx1] < nums2[idx2]
        pq.insert(nums1[idx1])
        idx1 += 1
      else
        pq.insert(nums2[idx2])
        idx2 += 1
      end      
    elsif idx1 < nums1.length
      pq.insert(nums1[idx1])
      idx1 += 1
    elsif idx2 < nums2.length
      pq.insert(nums2[idx2])
      idx2 += 1
    else
      break
    end
  end
  if pq.size == 1
    pq.top  
  else
    first, second = pq.delete_top, pq.delete_top
    if total_size % 2 == 0
      (first + second) / 2.0
    else
      second
    end
  end  
end

def find_min(nums1, idx1, nums2, idx2)
  min = nil
  if idx1 < nums1.length && idx2 < nums2.length
    if nums1[idx1] < nums2[idx2]
      min = nums1[idx1]
      idx1 += 1
    else
      min = nums2[idx2]
      idx2 += 1
    end      
  elsif idx1 < nums1.length
    min = nums1[idx1]
    idx1 += 1
  elsif idx2 < nums2.length
    min = nums2[idx2]
    idx2 += 1
  end
  [min, idx1, idx2]
end

def find_median_sorted_arrays(nums1, nums2)
  total_size = nums1.size + nums2.size
  first_median, idx1, idx2 = nil, 0, 0
  ((total_size + 1) / 2).times do
    first_median, idx1, idx2 = find_min(nums1, idx1, nums2, idx2)
  end
  if total_size % 2 == 0
    second_median, idx1, idx2 = find_min(nums1, idx1, nums2, idx2)
    (first_median + second_median) / 2.0 
  else
    first_median
  end
end
p find_median_sorted_arrays [1,2], [3,4]
p find_median_sorted_arrays [1, 3, 5], [2, 4]

p find_median_sorted_arrays [], [1]

#




# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  length = nums1.length + nums2.length
  if length % 2 == 0
    (find_nth_element(nums1, nums2, length/2) + find_nth_element(nums1, nums2, length/2 + 1)) / 2.0
  else
    find_nth_element(nums1, nums2, length/2 + 1).to_f
  end
end

def find_nth_element(nums1, nums2, n)
  find_nth_element_in_other(nums1, nums2, n) || find_nth_element_in_other(nums2, nums1, n)
end

def find_nth_element_in_other(nums1, nums2, n)
  low , high = 0, nums1.length - 1
  while low <= high
    mid = (low + high) / 2
    lesser_nums_in_other = get_position(nums2, nums1[mid])    
    exact_position = mid + 1 + lesser_nums_in_other
    return nums1[mid] if exact_position == n
    if exact_position > n
      high = mid - 1
    else
      low = mid + 1
    end
  end
  nil
end

def get_position(nums, target)
  return 0 if nums.empty?
  low, high = 0, nums.length - 1
  while low < high
    mid = (low + high) / 2
    if target >= nums[mid]
      low = mid + 1
    else
      high = mid - 1
    end
  end
  target >= nums[low] ? low + 1 : low
end

# p find_median_sorted_arrays [1,2], [3,4]
# p find_median_sorted_arrays [1, 3, 5], [2, 4]

# p find_median_sorted_arrays [], [1]
p find_median_sorted_arrays [1], [1]
#p get_position [1], 1
