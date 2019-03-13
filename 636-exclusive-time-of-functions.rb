# @param {Integer} n
# @param {String[]} logs
# @return {Integer[]}
def exclusive_time(n, logs)
  times = [0] * n
  stack = []
  logs.each do |line|
    id, transition, timestamp = read_log(line)
    if transition == 'end'
      _, _, start_timestamp, offset = stack.pop
      time_spent = timestamp - start_timestamp - offset + 1
      times[id] += time_spent
      offset += time_spent
      if !stack.empty?
        prev_id, prev_transition, prev_timestamp, prev_offset = stack.pop
        stack.push([prev_id, prev_transition, prev_timestamp, prev_offset + offset])
      end
    else
      stack.push([id, transition, timestamp, 0])
    end
  end
  times
end

def read_log(line)
  id, transition, timestamp = line.split(':')
  [id.to_i, transition, timestamp.to_i]
end

n = 2
logs = 
["0:start:0",
 "1:start:2",
 "1:end:5",
 "0:end:6"]

# n = 1
# logs = ["0:start:0","0:start:2","0:end:5","0:start:6","0:end:6","0:end:7"]

# n = 1
# logs = ["0:start:0","0:start:1","0:start:2","0:end:3","0:end:4","0:end:5"]
 p exclusive_time n, logs