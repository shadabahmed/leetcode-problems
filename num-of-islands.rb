def visit(grid, row, col)
  queue = [[row, col]]
  grid[row][col] = "0"
  while !queue.empty?
    row, col = queue.shift
    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |x, y|
      row, next_col = row + x, col + y
      next if next_row < 0 || next_col < 0
      next if next_row >= grid.length || next_col >= grid.first.length
      next if grid[next_row][next_col] != "1"
      grid[next_row][next_col] = "0"
      queue.push([next_row, next_col])
    end
  end
end

def num_islands(grid)
  count = 0
  0.upto(grid.length - 1) do |row|
    0.upto(grid.first.length - 1) do |col|
      next if grid[row][col] != "1"
      count += 1
      visit(grid, row, col)
    end
  end
  count
end

def dfs(grid, row, col)
  grid[row][col] = "0"
  return if row < 0 || col < 0 || row >= grid.length || col >= grid.first.length || grid[row][col] != "1"
  dfs(grid, row + 1, col)
  dfs(grid, row - 1, col)
  dfs(grid, row, col + 1)
  dfs(grid, row, col - 1)
end

def num_islands(grid)
  count = 0
  0.upto(grid.length - 1) do |row|
    0.upto(grid.first.length - 1) do |col|
      next if grid[row][col] != "1"
      count += 1
      dfs(grid, row, col)
    end
  end
  count
end

p num_islands(%w[11000 11000 00100 00011])

num_islands(%w[11000 11000 00100 00011])
