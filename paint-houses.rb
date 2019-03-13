INFINITY = 1.0 / 0

def min_cost(costs)
  return 0 if costs.empty?
  return costs.first.min if costs.length == 1
  min_sum = INFINITY
  max_row, max_col = costs.length - 1, costs.first.length - 1
  cum_grid = costs.length.times.collect { costs.first.length.times.collect { INFINITY } }
  0.upto(max_col) {|col| cum_grid[0][col] = costs[0][col]}
  1.upto(max_row) do |row_idx|
    0.upto(max_col).each do |current_col|
      0.upto(max_col) do |col|
        next if col == current_col
        sum = costs[row_idx][current_col] + cum_grid[row_idx - 1][col]
        cum_grid[row_idx][current_col] = sum if sum < cum_grid[row_idx][current_col]
        min_sum = sum if row_idx == max_row && sum < min_sum
      end
    end
  end
  min_sum
end

min_cost [[5,8,6],[19,14,13],[7,5,12],[14,15,17],[3,20,10]]
