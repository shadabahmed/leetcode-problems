class LRUCache
  class Node
    attr_accessor :key, :val, :prev, :next
    def initialize(key, val)
      self.key = key
      self.val = val
    end
  end

  attr_accessor :head, :tail, :map, :capacity

  def initialize(capacity)
    self.map = {}
    self.capacity = capacity
  end

  def get(key)
    if map.key?(key)
      move_to_front(map[key])
      map[key].val
    else
      -1
    end
  end

  def put(key, value)
    if !map.key?(key)
      evict if map.size == capacity
      map[key] = Node.new(key, value)
    elsif map[key].val != value
      map[key].val = value
    end
    move_to_front(map[key])
  end

  def print_entries()
    puts "MAP:"
    map.each do |k, v|
      puts "#{k} : #{v.val}"
    end
    head = self.head
    puts "LINKED LIST:"
    while head
      if head.next
        print "#{head.val} -> "
      else
        puts head.val
      end
      head = head.next
    end
  end

  private
  def evict
    if tail
      map.delete(self.tail.key)
      tail.prev.next = tail.next if tail.prev
      self.tail = tail.prev
      self.head = nil if tail.nil?
    end
  end

  def move_to_front(node)
    if head.nil?
      self.head = node
      self.tail = node
    elsif node != head
      # remove from current position
      node.prev.next = node.next if node.prev
      if node.next
        node.next.prev = node.prev
      elsif self.tail == node
        self.tail = node.prev
      end

      # place it at head
      node.next = self.head
      head.prev = node
      node.prev = nil
      self.head = node
    end
  end
end

<<-DATA
require './lru_cache'
cache = LRUCache.new(2)

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       # returns 1
cache.put(3, 3);    # evicts key 2
cache.get(2);       # returns -1 (not found)
cache.put(4, 4);    # evicts key 1
cache.get(1);       # returns -1 (not found)
cache.get(3);       # returns 3
cache.get(4);
DATA
