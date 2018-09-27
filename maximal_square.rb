# @param {Character[][]} matrix
# @return {Integer}
def maximal_square(matrix)
  max = 0
  0.upto(matrix.length - 1) do |row|
    0.upto(matrix.first.length - 1) do |col|
      next if matrix[row][col].zero?
      if row > 0 && col > 0
        prev_square = matrix[row - 1][col - 1]
        if row.downto(row - prev_square).all? { |row| matrix[row][col] > 0 } && col.downto(col - prev_square).all? { |col| matrix[row][col] > 0 }
          matrix[row][col] = prev_square + 1
        end
      end
      max = matrix[row][col] if max < matrix[row][col]
    end
  end
  max * max
end

def maximal_square(matrix)
  return 0 if matrix.empty?
  max = 0
  dp = (matrix.length + 1).times.collect { (matrix.first.length + 1).times.collect { 0 } }
  0.upto(matrix.length - 1) do |row|
    0.upto(matrix.first.length - 1) do |col|
      next if matrix[row][col] == "0"
      dp[row + 1][col + 1] = [dp[row][col], dp[row + 1][col], dp[row][col + 1]].min + 1
      max = dp[row + 1][col + 1] if dp[row + 1][col + 1] > max
    end
  end
  max * max
end

p maximal_square [%w[1 0 1 1 1],
                  %w[1 0 1 1 1],
                  %w[1 1 1 1 1],
                  %w[1 0 0 1 0]]
