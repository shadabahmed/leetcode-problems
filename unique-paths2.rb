# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  max_row, max_col = obstacle_grid.length - 1, obstacle_grid.first.length - 1
  paths_grid = 0.upto(max_row).collect { 0.upto(max_col).collect { 0 } }
  paths_grid[max_row][max_col] = 1
  max_row.downto(0) do |row|
    max_col.downto(0) do |col|
      if obstacle_grid[row][col] == 1
        paths_grid[row][col] = 0
      else
        paths_grid[row][col] += paths_grid[row][col + 1] if col < max_col
        paths_grid[row][col] += paths_grid[row + 1][col] if row < max_row
      end
    end
  end
  paths_grid[0][0]
end

p unique_paths_with_obstacles([[0,0,0],[0,0,0]])
