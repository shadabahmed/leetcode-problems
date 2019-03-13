# https://leetcode.com/problems/random-pick-with-blacklist/submissions/

class Solution
  #:type n: Integer
  #:type blacklist: Integer[]
  attr_accessor :buckets
  def initialize(n, blacklist)
    blacklist.sort!
    self.buckets = []
    last_start = 0
    last_count = 0
    blacklist.each_with_index do |num, idx|
      if num > last_start
        last_count = last_count + num - last_start
        buckets << [last_count, last_start, num - 1]                
      end
      last_start = num + 1
    end
    if last_start <= n - 1
      buckets << [last_count + n - last_start, last_start, n - 1]
    end
  end

  #:rtype: Integer
  def pick
    last_range = self.buckets.last.first
    bucket_num = rand(1..last_range)
    bucket = get_bucket(bucket_num)
    rand(bucket[1]..bucket[2])
  end

  def get_bucket(bucket_num)
    first, last = 0, buckets.length - 1
    while first <= last
      mid = (first + last) / 2
      return buckets[mid] if buckets[mid].first >= bucket_num && (mid.zero? || buckets[mid - 1].first < bucket_num)
      if buckets[mid].first < bucket_num
        first = mid + 1
      elsif buckets[mid].first > bucket_num
        last = mid - 1
      end
    end
  end
end

# Your Solution object will be instantiated and called as such:
obj = Solution.new(4, [0])

p obj.buckets
p obj.pick()
p obj.pick()
p obj.pick()
p obj.pick()
p obj.pick()
p obj.pick()
