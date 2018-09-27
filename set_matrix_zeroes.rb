def set_zeroes(matrix)
  rows = matrix.length
  cols = rows.zero? ? 0 : matrix.first.length
  0.upto(rows - 1) do |row|
    0.upto(cols - 1) do |col|      
      if matrix[row][col] == 0
        0.upto(cols - 1) do |z_col|
          matrix[row][z_col] = nil if matrix[row][z_col] != 0
        end
        0.upto(rows - 1) do |z_row|
          matrix[z_row][col] = nil if matrix[z_row][col] != 0
        end
        matrix[row][col] = nil
      end
    end
  end

  0.upto(rows - 1) do |row|
    0.upto(cols - 1) do |col|
      if matrix[row][col] == nil
        matrix[row][col] = 0
      end
    end
  end
  matrix
end

p set_zeroes [[0,1]]
