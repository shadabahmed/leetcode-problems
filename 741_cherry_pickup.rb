NEG_INFINITY = -1.0/0

def create_table(grid)
  max_row, max_col = grid.length - 1, grid.first.length - 1
  table = grid.length.times.collect { grid.first.length.times.collect { 0 } }
  table[0][0] = grid[0][0]
  0.upto(max_row) do |row|
    0.upto(max_col) do |col|
      next if row == 0 && col == 0
      if grid[row][col] == -1
        table[row][col] = NEG_INFINITY
      else
        if row == 0
          table[row][col] = grid[row][col] + table[row][col - 1]
        elsif col == 0
          table[row][col] = grid[row][col] + table[row - 1][col]
        else
          table[row][col] = grid[row][col] + [table[row][col - 1],table[row - 1][col]].max
        end
      end
    end
  end
  table
end

def print_grid(grid)
  puts ''
  grid.each {|row| puts row.join(' , ')}
end

def cherry_pickup(grid)
  max_row, max_col = grid.length - 1, grid.first.length - 1
  first_pass_table = create_table(grid)
  second_pass_table = create_table(grid)
  row, col = max_row, max_col
  print_grid grid
  print_grid first_pass_table
  while row >= 0 && col >= 0
    grid[row][col] = 0
    if row == 0
      col -= 1
    elsif col == 0
      row -= 1
    elsif first_pass_table[row - 1][col] > first_pass_table[row][col - 1]
      row -= 1
    else
      col -= 1
    end
  end
  second_pass_table = create_table(grid)
  print_grid grid
  print_grid second_pass_table
  [0, first_pass_table[max_row][max_col] + second_pass_table[max_row][max_col]].max
end


p cherry_pickup [[1,1,1,1,0,0,0],[0,0,0,1,0,0,0],[0,0,0,1,0,0,1],[1,0,0,1,0,0,0],[0,0,0,1,0,0,0],[0,0,0,1,0,0,0],[0,0,0,1,1,1,1]]
