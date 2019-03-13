class MyHashMap
  BUCKET_MOD = 10_000

  class Node < Struct.new(:key, :val, :next); end
=begin
  Initialize your data structure here.
=end
  def initialize()
    @buckets = []
  end

=begin
  value will always be non-negative.
  :type key: Integer
  :type value: Integer
  :rtype: Void
=end
  def put(key, value)
    slot = key % BUCKET_MOD
    head = @buckets[slot]
    if !head
      @buckets[slot] = Node.new(key, value)
      return
    end
    while head
      if head.key == key
        head.val = value
        break
      elsif head.next.nil?
        head.next = Node.new(key, value)
        break
      end
      head = head.next
    end
  end

=begin
    Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key
    :type key: Integer
    :rtype: Integer
=end
  def get(key)
    slot = key % BUCKET_MOD
    head = @buckets[slot]
    while head
      return head.val if head.key == key
      head = head.next
    end
    -1
  end

=begin
    Removes the mapping of the specified value key if this map contains a mapping for the key
    :type key: Integer
    :rtype: Void
=end
  def remove(key)
    slot = key % BUCKET_MOD
    head = @buckets[slot]
    return unless head
    if head.key == key
      @buckets[slot] = head.next
    else
      head = head.next while head.next && head.next.key != key
      if head.next && head.next.key == key
        head.next = head.next.next
      end
    end
  end
end

# Your MyHashMap object will be instantiated and called as such:
key = 1
value = 2
obj = MyHashMap.new()
obj.put(key, value)
obj.put(10001, 10001)
param_2 = obj.get(key)
obj.remove(key)
p obj.get(1)
p obj.get(10001)
