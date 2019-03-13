# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  total_gas = gas.sum
  total_cost = cost.sum
  return -1 if total_gas < total_cost
  0.upto(gas.length - 1) do |idx|
    start_idx = idx
    sum = 0
    idx.upto(idx + gas.length - 1) do |idx|
      idx = idx % gas.length if idx >= gas.length
      sum += gas[idx] - cost[idx]
      break if sum < 0
      return start_idx if (idx + 1) % gas.length == start_idx
    end
  end
  -1
end
gas  = [1,2,3,4,5]
cost = [3,4,5,1,2]
can_complete gas, cost


def can_complete_circuit(gas, cost)
  total_gas = 0
  total_cost = 0
  sum, min_sum, min_idx = 0, 1.0 / 0, 0
  0.upto(gas.length - 1) do |idx|
    total_gas += gas[idx]
    total_cost += cost[idx]
    sum += gas[idx] - cost[idx]
    if sum < min_sum
      min_idx = idx
      min_sum = sum
    end
  end
  total_gas > total_cost ? (min_idx + 1) % gas.length : -1
end
gas  = [1,2,3,4,5]
cost = [3,4,5,1,2]
can_complete_circuit gas, cost
