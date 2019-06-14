# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  res = [new_interval]
  intervals.each do |interval|
    current_start, current_end = interval
    prev_start, prev_end = prev_interval = res.pop
    if current_end < prev_start
      res.push(interval)
      res.push(prev_interval)
    elsif current_start <= prev_end
      res.push([[current_start, prev_start].min, [current_end, prev_end].max])
    else      
      res.push(prev_interval)
      res.push(interval)
    end  
  end
  res
end

p insert intervals = [[1, 3], [6, 9]], newInterval = [2, 5]
p insert intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,800]
p insert intervals = [[-11,5]], [-1,3]