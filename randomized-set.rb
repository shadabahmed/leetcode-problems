class RandomizedSet
  attr_accessor :map, :arr, :size
  def initialize()
    self.map = {}
    self.arr = []
    self.size = 0
  end

=begin
  Inserts a value to the set. Returns true if the set did not already contain the specified element.
  :type val: Integer
  :rtype: Boolean
=end
  def insert(val)
    if map.key?(val)
      false
    else
      map[val] = size
      arr[size] = val
      self.size += 1
      true
    end
  end

=begin
  Removes a value from the set. Returns true if the set contained the specified element.
  :type val: Integer
  :rtype: Boolean
=end
  def remove(val)
    if map.key?(val)
      idx = map.delete(val)
      if idx != size - 1
        arr[idx], arr[size - 1] = arr[size - 1], arr[idx]
        map[arr[idx]] = idx
      end
      self.size -= 1
      true
    else
      false
    end
  end

  def get_random()
    arr[rand(size)]
  end
end

set = RandomizedSet.new
set.insert(1)
set.remove(2)
set.insert(2)
set.get_random
set.remove 1
set.insert 2
set.get_random


set = RandomizedSet.new
set.remove(0)
set.remove(0)
set.insert(0)
set.get_random
set.remove 0
set.insert 0
