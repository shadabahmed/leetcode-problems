def merge(intervals)
  return intervals if intervals.empty?
  intervals.sort!{|i, j| i.start <=> j.start}
  res = [intervals.first]
  1.upto(intervals.length - 1) do |idx|
    left = res.last
    right = intervals[idx]
    if right.start > left.end
      res.push(right)
    elsif right.end > left.end
      left.end = right.end
    end
  end
  res
end


class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end
end

intervals = [Interval.new(1,4), Interval.new(3,5), Interval.new(8,10)]
p merge intervals
p intervals
