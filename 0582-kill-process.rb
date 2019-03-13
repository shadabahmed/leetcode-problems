# @param {Integer[]} pid
# @param {Integer[]} ppid
# @param {Integer} kill
# @return {Integer[]}
def kill_process(pid, ppid, kill)
  map = {}
  0.upto(ppid.length - 1) do |idx|
    map[ppid[idx]] ||= []
    map[ppid[idx]] << pid[idx]
  end
  queue = [kill]
  res = []
  while !queue.empty?
    kill_pid = queue.shift
    res << kill_pid
    if map[kill_pid]
      map[kill_pid].each {|child| queue << child}
    end
  end
  res
end

pid =  [1, 3, 10, 5]
ppid = [3, 0, 5, 3]
kill = 5

p kill_process pid, ppid, 3