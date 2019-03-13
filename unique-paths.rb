# @param {Integer[][]} obstacle_grid
# @return {Integer}
require 'pry'
def unique_paths(m, n)
  paths_grid = m.times.collect{0}
  paths_grid[m - 1] = 1
  n.times do
    next_row = 0
    (m - 2).downto(0) do |col|
      next_row = paths_grid[col]
      paths_grid[col] = paths_grid[col + 1] + next_row
    end
  end
  paths_grid[0]
end

#
# def unique_paths(m, n)
#   return unique_paths(n, m) if m < n
#   max_row, max_col = n - 1, m - 1
#   paths_grid = n.times.collect { m.times.collect {0} }
#   paths_grid[max_row][max_col] = 1
#   (max_row).downto(0) do |row|
#     (max_col).downto(0) do |col|
#       paths_grid[row][col] += paths_grid[row][col + 1] if col < max_col
#       paths_grid[row][col] += paths_grid[row + 1][col] if row < max_row
#     end
#   end
#   paths_grid
# end
p unique_paths(7 ,3)
p unique_paths(3 ,7)
# def unique_paths(m, n)
#   return 1 if m == 1 || n == 1
#   unique_paths(m - 1, n) + unique_paths(m, n - 1)
# end
#
# p unique_paths(7 ,3)
