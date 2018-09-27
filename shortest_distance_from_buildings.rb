INFINITY = 1.0 / 0

def neighbours(grid, row, col)
  row_range = 0..(grid.length - 1)
  col_range = 0..(grid.first.length - 1)
  [[0, -1], [0, 1], [1,0], [-1, 0]].each do |row_inc, col_inc|
    row_inc += row
    col_inc += col
    if row_range.include?(row_inc) && col_range.include?(col_inc) && grid[row_inc][col_inc] == 0
      yield [row_inc, col_inc]
    end
  end
end

def travel(grid, row, col)
  visited = grid.length.times.collect{ grid.first.length.times.collect { 0 } }
  dist_grid = grid.length.times.collect{ grid.first.length.times.collect { INFINITY } }
  queue = [[row, col, 0]]
  visited[row][col] = 1
  while !queue.empty?
    row, col, dist = queue.shift
    neighbours(grid, row, col) do |n_row, n_col|
      next if visited[n_row][n_col] != 0
      visited[n_row][n_col] = 1
      dist_grid[n_row][n_col] = dist + 1
      queue.push([n_row, n_col, dist + 1])
    end
  end
  dist_grid
end

def sum_grids(left_grid, right_grid)
  0.upto(left_grid.length - 1) do |row|
    0.upto(left_grid.first.length - 1) do |col|
      left_grid[row][col] += right_grid[row][col]
    end
  end
end

def find_min(dist_grid)
  dist_grid.collect{|row| row.min}.min
end

def shortest_distance(grid)
  return -1 if grid.empty?
  all_dist_grid = grid.length.times.collect{ grid.first.length.times.collect { 0 } }
  0.upto(grid.length - 1) do |row|
    0.upto(grid.first.length - 1) do |col|
      sum_grids(all_dist_grid, travel(grid, row, col)) if grid[row][col] == 1
    end
  end
  min = find_min(all_dist_grid)
  min == INFINITY ? -1 : min
end

p shortest_distance [[1,0,2,0,1],[0,0,0,0,0],[0,0,1,0,0]]
#p shortest_distance [[1,1],[0,1]]
