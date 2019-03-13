# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def initialize(s=0, e=0)
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @return {Integer}
def min_meeting_rooms(intervals)
  max = 0
  rooms = Hash.new(0)
  intervals.each do |first, last|
    first.upto(last) do |time|
      rooms[time] += 1
      max = rooms[time] if max < rooms[time]
    end
  end
  max
end

Interval = Struct.new(:start, :end)

def intersect?(first, second)
  first.end > second.start && first.start < second.end
end

def min_meeting_rooms(intervals)
  intervals.sort_by! { |i| i.start }
  max, rooms = 0, 0
  intersection = intervals.last
  (intervals.length - 1).downto(0) do |idx|
    current = intervals[idx]
    rooms = 1
    (idx - 1).downto(0) do |prev_idx|
      prev = intervals[prev_idx]
      if intersect?(current, prev)
        current = Interval.new([current.start, prev.start].max, [current.end, prev.end].min)
        rooms += 1
      else
        break
      end
    end
    max = rooms if rooms > max
  end
  max
end

def min_meeting_rooms(intervals)
  intervals.sort_by! { |i| i.start }
  max = 0
  0.upto(intervals.length - 1) do |idx|
    break if max > (intervals.length - idx)
    current_int = intervals[idx]
    rooms = 1
    (idx + 1).upto(intervals.length - 1) do |other_idx|
      other_int = intervals[other_idx]
      next if current_int.end <= other_int.start
      rooms += 1
    end
    max = rooms if max < rooms
  end
  max
end

def min_meeting_rooms(intervals)
  intervals.sort_by! { |i| i.start }
  max = 0
  0.upto(intervals.length - 1) do |idx|
    break if max > (intervals.length - idx)
    current_int = intervals[idx]
    rooms = 1
    (idx + 1).upto(intervals.length - 1) do |other_idx|
      other_int = intervals[other_idx]
      next if current_int.end <= other_int.start
      rooms += 1
    end
    max = rooms if max < rooms
  end
  max
end

def min_meeting_rooms(intervals)
  intervals.sort_by! { |i| i.start }
  end_times = intervals.sort_by { |i| i.end }.collect(&:end)
  map = Hash.new(0)
  max = 0
  intervals.each do |interval|
    end_times.each do |end_time|
      if interval.start < end_time
        map[end_time] += 1
        max = map[end_time] if max < map[end_time]
        break
      end
    end
  end
  p map
  max
end

def min_meeting_rooms(intervals)
  max, rooms, queue = 0, 0, []
  intervals.each do |interval|
    queue.push([interval.start, 1])
    queue.push([interval.end, -1])
  end
  queue.sort_by! { |time, inc| [time, inc] }
  queue.each do |_, count|
    rooms += count
    max = rooms if rooms > max
  end
  max
end

#p min_meeting_rooms([[1, 5], [1, 3], [1, 2], [4, 5]].collect { |(first, last)| Interval.new(first, last) })

intervals = [[4, 18], [1, 35], [12, 45], [25, 46], [22, 27]]
intervals = [[13, 15], [1, 13]]
p min_meeting_rooms(intervals.collect { |(first, last)| Interval.new(first, last) })

# --------
# -- --
#     --
