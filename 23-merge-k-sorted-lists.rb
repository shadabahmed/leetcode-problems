# https://leetcode.com/problems/merge-k-sorted-lists/

require 'pry'

class Heap
  attr_accessor :arr, :comparator

  def initialize(comparator = -> (x, y) { x < y})
    self.comparator = comparator
    self.arr = []
  end

  def empty?
    arr.empty?
  end

  def add(elem)
    arr.push(elem)
    heapify_up(arr.length - 1)
  end

  def remove_first()
    swap(0, arr.length - 1)
    first = arr.pop
    heapify_down(0)
    first
  end

  def compare(left, right)
    comparator.call(arr[left],arr[right])
  end

  def swap(idx1, idx2)
    arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
  end

  def left_child(idx)
    2 * idx
  end

  def right_child(idx)
    2 * idx + 1
  end

  def parent(idx)
    idx / 2
  end

  def heapify_down(idx)
    priority_idx = idx
    left_idx = left_child(idx)
    right_idx = right_child(idx)
    if left_idx < arr.size && compare(left_idx, priority_idx)
      priority_idx = left_idx
    end

    if right_idx < arr.size && compare(right_idx, priority_idx)
      priority_idx = right_idx
    end

    if idx != priority_idx
      swap(idx, priority_idx)
      heapify_down(priority_idx)
    end
  end

  def heapify_up(idx)
    parent_idx = parent(idx)
    if compare(idx, parent_idx)
      swap(idx, parent_idx)
      heapify_up(parent_idx)
    end
  end
end

def merge_k_lists_heap(lists)
  return nil if lists.empty?
  h = Heap.new(->(x,y) {x.val < y.val})
  lists.each do |list|
    next if list.nil?
    h.add(list)
  end
  head = tail = ListNode.new(0)
  while !h.empty?
    min_node = h.remove_first
    h.add(min_node.next) if min_node.next
    tail.next = min_node
    tail = tail.next
  end
  head.next
end

def merge_two_lists(left, right)
  head = tail = ListNode.new(0)
  while left && right
    if left.val <= right.val
      tail.next = left
      left = left.next
    else
      tail.next = right
      right = right.next
    end
    tail = tail.next
  end

  if left
    tail.next = left
  end

  if right
    tail.next = right
  end

  head.next
end

def merge_k_lists_recursive(lists, first = 0, last = lists.size - 1)
  return nil if first > last
  return lists[first] if first == last
  mid = first + (last - first) / 2
  merge_two_lists(merge_k_lists_recursive(lists, 0, mid), merge_k_lists_recursive(lists, mid + 1, last))
end

def merge_k_lists_iterative(lists)
  lists.reduce do |list1, list2|
    merge_two_lists(list1, list2)
  end
end


class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)

l2 = ListNode.new(3)
l2.next = ListNode.new(4)

p merge_k_lists_recursive([l1, l2])
#p merge_k_lists([l1, l2])
