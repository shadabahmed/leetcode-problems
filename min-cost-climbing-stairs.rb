def min_cost_climbing_stairs(cost)
  last_step, last_last_step = 0, 0
  0.upto(cost.size) do |idx|
    current_cost = idx == cost.size ? 0 : cost[idx]
    current_step = [last_step, last_last_step].min + current_cost
    last_last_step = last_step
    last_step = current_step
  end
  last_step
end
