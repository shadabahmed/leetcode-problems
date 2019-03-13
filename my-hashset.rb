class MyHashSet
  BUCKET_MOD = 10_000
=begin
    Initialize your data structure here.
=end
  def initialize()
    @buckets = []
  end

=begin
    :type key: Integer
    :rtype: Void
=end
  def add(key)
    slot = key % BUCKET_MOD
    @buckets[slot] ||= []
    @buckets[slot].push(key)
  end

=begin
    :type key: Integer
    :rtype: Void
=end
  def remove(key)
    slot = key % BUCKET_MOD
    @buckets[slot] && @buckets[slot].delete(key)
  end

=begin
    Returns true if this set contains the specified element
    :type key: Integer
    :rtype: Boolean
=end
  def contains(key)
    slot = key % BUCKET_MOD
    @buckets[slot] && @buckets[slot].include?(key) || false
  end
end

# Your MyHashSet object will be instantiated and called as such:
obj = MyHashSet.new()
obj.add(1)
obj.remove(1)
param_3 = obj.contains(1)
