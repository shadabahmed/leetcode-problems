def min_path_sum(grid)
  return 0 if grid.empty?
  max_row, max_col = grid.length - 1, grid.first.length - 1
  sum_grid = grid.length.times.collect { grid.first.length.times.collect { 0 }}
  sum_grid[0][0] = grid[0][0]
  0.upto(max_row) do |row|
    0.upto(max_col) do |col|
      next if row == 0 && col == 0
      min = if row == 0
              sum_grid[row][col - 1]
            elsif col == 0
              sum_grid[row - 1][col]
            else
              [sum_grid[row - 1][col], sum_grid[row][col - 1]].min
            end
      sum_grid[row][col] = grid[row][col] + min
    end
  end
  sum_grid[max_row][max_col]
end

def min_path_sum(grid)
  return 0 if grid.empty?
  max_row, max_col = grid.length, grid.first.length
  sum_grid = (max_row + 1).times.collect { (max_col + 1).times.collect { 0 }}
  2.upto(max_row) {|row| sum_grid[row][0] = sum_grid[row - 1][0] + grid[row - 2][0]}
  2.upto(max_col) {|col| sum_grid[0][col] = sum_grid[0][col - 1] + grid[0][col - 2]}
  1.upto(max_row) do |row|
    1.upto(max_col) do |col|
      sum_grid[row][col] = grid[row - 1][col - 1] + [sum_grid[row - 1][col], sum_grid[row][col - 1]].min
    end
  end
  p sum_grid
  sum_grid[max_row][max_col]
end

min_path_sum [[1,3,1],[1,5,1],[4,2,1]]
