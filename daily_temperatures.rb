# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  stack = []
  res = [0] * temperatures.size
  0.upto(temperatures.size - 1) do |idx|
    while !stack.empty? && temperatures[stack.last] < temperatures[idx]
      prev_idx = stack.pop
      res[prev_idx] = idx - prev_idx
    end
    stack.push(idx)
  end
  res
end

p daily_temperatures [73, 74, 75, 71, 69, 72, 76, 73]
