def search_matrix(matrix, target)
  row, col = 0, matrix.first.length - 1
  while row < matrix.length && col >= 0
    return true if matrix[row][col] == target
    if matrix[row][col] < target
      row += 1
    else
      col -= 1
    end
  end
  false
end

matrix = [
  [1, 4, 7, 11, 15],
  [2, 5, 8, 12, 19],
  [3, 6, 9, 16, 22],
  [10, 13, 14, 17, 24],
  [18, 21, 23, 26, 30],
]

p search_matrix matrix, 5
p search_matrix matrix, 20
