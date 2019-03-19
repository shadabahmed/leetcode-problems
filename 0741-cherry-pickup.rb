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


def get_dp_matrix(grid)
  (grid.length + 1).times.collect do 
    (grid.first.length + 1).times.collect do
      (grid.length + 1).times.collect do
        (grid.first.length + 1).times.collect do 
          0
        end
      end
    end
  end
end

def cherry_pickup(grid)
  dp = get_dp_matrix(grid)
  1.upto(grid.length) do |row1|
    1.upto(grid.first.length) do |col1|
      1.upto(grid.length) do |row2|
        1.upto(grid.first.length) do |col2|
          cell_val1 = grid[row1 - 1][col1 - 1]
          cell_val2 = grid[row2 - 1][col2 - 1]
          if cell_val1 >= 0 && cell_val2 >= 0
            dp[row][col][row][col] = [dp[row1 - 1][col1][0][0], dp[row1][col1 - 1][0][0]].max

                          
          end
          dp[row1][col1][row2][col2] += cell_val1 + cell_val2
        end
      end      
    end
  end
  dp[grid.length][grid.first.length][grid.length][grid.first.length]
end

p cherry_pickup [[1,1,1,1,0,0,0],[0,0,0,1,0,0,0],[0,0,0,1,0,0,1],[1,0,0,1,0,0,0],[0,0,0,1,0,0,0],[0,0,0,1,0,0,0],[0,0,0,1,1,1,1]]
