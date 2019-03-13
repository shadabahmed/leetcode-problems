class Interval
  attr_accessor :start, :end
  def initialize(s=0, e=0)
    @start = s
    @end = e
  end
end

def min_meeting_rooms(intervals)
  return 0 if intervals.empty?
  intervals.sort_by!{|i| i.start}
  max_interval = intervals.first
  rooms_required = 1
  1.upto(intervals.length - 1) do |idx|
    current_interval = intervals[idx]
    rooms_required += 1 if current_interval.start <= max_interval.end
    max_interval = current_interval if current_interval.end > max_interval.end
  end
  rooms_required
end

intervals = [[0, 30],[5, 10],[15, 20]].collect{|s, e| Interval.new(s,e)}

min_meeting_rooms(intervals)
