# https://leetcode.com/problems/toeplitz-matrix/

# @param {Integer[][]} matrix
# @return {Boolean}
def is_toeplitz_matrix(matrix)
  rows = matrix.length
  cols = matrix.first.length
  (rows - 1).downto(0) do |row|
    return false unless check_diagonal(matrix, row, 0)
  end
  1.upto(cols - 1) do |col|
    return false unless check_diagonal(matrix, 0, col)
  end
  true
end

def check_diagonal(matrix, row, col)
  rows = matrix.length
  cols = matrix.first.length
  val = matrix[row][col]
  row += 1
  col += 1
  while row < rows && col < cols
    return false if matrix[row][col] != val
    row += 1
    col += 1
  end
  true
end

matrix = [
  [1, 2, 3, 4],
  [5, 1, 2, 3],
  [9, 5, 1, 2]
]

matrix = [
  [1, 2],
  [2, 2]
]
p is_toeplitz_matrix matrix
