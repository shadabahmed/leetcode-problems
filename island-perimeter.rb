
def get_cell_border(grid, row, col)
  max_row = grid.length - 1
  max_col = grid.first.length - 1
  border = 0
  # find top
  if row == 0 || grid[row - 1][col] == 0
    border += 1
  end

  # find right
  if col == max_col || grid[row][col + 1] == 0
    border += 1
  end

  # find bottom
  if row == max_row || grid[row + 1][col] == 0
    border += 1
  end

  # find left
  if col == 0 || grid[row][col - 1] == 0
    border += 1
  end
  border
end


def island_perimeter(grid)
  max_row = grid.length - 1
  max_col = grid.first.length - 1
  perimeter = 0
  0.upto(max_row) do |row|
    0.upto(max_col) do |col|
      next if grid[row][col] == 0
      perimeter += get_cell_border(grid, row, col)
    end
  end
  perimeter
end


island_perimeter [[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]
