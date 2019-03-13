INFINITY = 1.0 / 0

def get_mins(nums)
  left_mins = (nums.length + 2).times.collect{ INFINITY }
  right_mins = (nums.length + 2).times.collect{ INFINITY }
  arr = []
  0.upto(nums.length - 1) do |idx|
    if nums[idx] < left_mins[idx - 1]
      left_mins[idx] = nums[idx]
    else
      left_mins[idx] = left_mins[idx - 1]
    end
  end
  (nums.length - 1).downto(0) do |idx|
    if nums[idx] < right_mins[idx + 1]
      right_mins[idx] = nums[idx]
    else
      right_mins[idx] = right_mins[idx + 1]
    end
  end
  0.upto(nums.length - 1) do |idx|
    arr[idx] = [left_mins[idx - 1], right_mins[idx + 1]].min
  end
  arr
end

def min_cost_ii(costs)
  return 0 if costs.empty?
  return costs.first.min if costs.length == 1
  min_cost = INFINITY
  max_row, max_col = costs.length - 1, costs.first.length - 1
  costs_grid = costs.length.times.collect { costs.first.length.times.collect { 0 }}
  costs.first.each_with_index{|num, idx| costs_grid[0][idx] = num}
  1.upto(max_row) do |row|
    min_costs_if_not_paint = get_mins(costs_grid[row - 1])
    0.upto(max_col) do |col|
      costs_grid[row][col] = min_costs_if_not_paint[col] + costs[row][col]
      min_cost = costs_grid[row][col] if row == max_row && costs_grid[row][col] < min_cost
    end
  end
  min_cost
end

min_cost_ii [[1,5,3],[2,9,4]]
