# class Heap
#   attr_accessor :arr, :comparator

#   def initialize(comparator = -> (x, y) { x < y})
#     self.comparator = comparator
#     self.arr = []
#   end

#   def empty?
#     arr.empty?
#   end

#   def add(elem)
#     arr.push(elem)
#     heapify_up(arr.length - 1)
#   end

#   def remove_first()
#     swap(0, arr.length - 1)
#     first = arr.pop
#     heapify_down(0)
#     first
#   end

#   def compare(left, right)
#     comparator.call(arr[left],arr[right])
#   end

#   def swap(idx1, idx2)
#     arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
#   end

#   def left_child(idx)
#     2 * idx
#   end

#   def right_child(idx)
#     2 * idx + 1
#   end

#   def parent(idx)
#     idx / 2
#   end

#   def heapify_down(idx)
#     priority_idx = idx
#     left_idx = left_child(idx)
#     right_idx = right_child(idx)
#     if left_idx < arr.size && compare(left_idx, priority_idx)
#       priority_idx = left_idx
#     end

#     if right_idx < arr.size && compare(right_idx, priority_idx)
#       priority_idx = right_idx
#     end

#     if idx != priority_idx
#       swap(idx, priority_idx)
#       heapify_down(priority_idx)
#     end
#   end

#   def heapify_up(idx)
#     parent_idx = parent(idx)
#     if compare(idx, parent_idx)
#       swap(idx, parent_idx)
#       heapify_up(parent_idx)
#     end
#   end
# end


# def nth_ugly_number(n)
#   heap = Heap.new
#   heap.add(1)
#   while n > 1
#     num = heap.remove_first
#     multipliers = if num % 2 == 0 || num == 1
#                     [2,3,5]
#                   elsif num % 3 == 0
#                     [3,5]
#                   else
#                     [5]
#                   end
#     multipliers.each do |multiplier|
#       heap.add(num * multiplier)
#       n -= 1
#       break unless num > 1
#     end
#   end
#   num = heap.remove_first
#   while !heap.empty?
#     num = heap.remove_first
#   end
#   num
# end

# def nth_ugly_number(n)
#   return 0 if n < 1
#   return 1 if n == 1
  
# end

# # queue, n = [1], 0
# # while n < 1000
# #   num = queue[n]
# #   if num % 2 == 0 || num == 1
# #     queue += [num * 2, num * 3, num * 5]
# #   elsif num % 3 == 0
# #     queue += [num * 3, num * 5]
# #   elsif num % 5 == 0
# #     queue << num * 5
# #   end
# #   n += 1
# # end
# nth_ugly_number(5)
# # p nth_ugly_number 6
# # p nth_ugly_number 7
# 1.upto(5) { |n|
#   p [n, nth_ugly_number(n)]
# }


def is_ugly(num)
  return false if num <= 0
  while num > 1
    if num % 2 == 0
      num /= 2
    elsif num % 3 == 0
      num /= 3
    elsif num % 5 == 0
      num /= 5
    else
      return false
    end
  end
  true
end

is_ugly 2147483648

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

def nth_ugly_number(n)
  pq = PQ.new {|x,y| x < y}
  inserted = {}
  pq.insert(1)
  while n > 1
    min = pq.remove_top
    inserted.delete(min)
    [2, 3, 5].each do |multiplier|
      num = multiplier * min
      pq.insert(num) unless inserted.key?(num)
      inserted[num] = true
    end
    n -= 1
  end
  pq.top
end


p nth_ugly_number 332