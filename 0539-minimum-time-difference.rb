# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
  absolute_times = []
  time_points.collect do |time| 
    append_converted_time(time, absolute_times)
  end
  absolute_times.sort!  
  min_diff = 1440
  0.upto(absolute_times.length - 2) do |idx|
    current, nxt = absolute_times[idx], absolute_times[idx + 1]
    min_diff = nxt - current if nxt - current < min_diff
  end
  min_diff
end

def append_converted_time(time, converted_times)
  hours, minutes = time.split(':').collect(&:to_i)
  abs_time = (hours * 60) + minutes
  converted_times << abs_time
  converted_times << 1440 + abs_time if hours < 12  
end




# @param {String[]} time_points
# @return {Integer}
def find_min_difference(time_points)
  time_points = time_points.collect{|time| convert_time(time)}
  time_points.sort!
  min_diff = 1440
  0.upto(time_points.length - 2) do |idx|
    current, nxt = time_points[idx], time_points[idx + 1]
    min_diff = nxt - current if nxt - current < min_diff
  end
  other_diff = 1440 - (time_points.last - time_points.first)
  [min_diff, other_diff].min
end

def convert_time(time)
  hours, minutes = time.split(':').collect(&:to_i)
  (hours * 60) + minutes  
end
#p find_min_difference ["23:59","00:00"]
p find_min_difference ["05:31","22:08","00:35"]