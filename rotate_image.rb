# You are given an n x n 2D matrix representing an image.
#
# Rotate the image by 90 degrees (clockwise).

[1,  2,   3,   4]
[5,  6,   7,   8]
[9,  10,  11, 12]
[13, 14 , 15, 16]


[13, 9, 5 , 1]
[14, 19, 6, 2]
[15, 11, 7, 3]
[16, 13, 8, 4]

# Given input matrix =
# [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ],
#
# rotate the input matrix in-place such that it becomes:
# [
#   [7,4,1],
#   [8,5,2],
#   [9,6,3]
# ]
#

def reverse_row(row)
  left, right = 0, row.length - 1
  while left < right
    row[left], row[right] = row[right], row[left]
    left += 1
    right -= 1
  end
end

def rotate_matrix(matrix)
  return if matrix.size.zero?
  m, n = matrix.length - 1, matrix.first.length - 1
  row, col = 0, 0
  while col < m && row < n
    i, j = row + 1, col + 1
    while i + j <= m + n
      matrix[i][col], matrix[row][j] = matrix[row][j], matrix[i][col]
      i += 1
      j += 1
    end
    col += 1
    row += 1
  end
  matrix.each do |row|
    reverse_row(row)
  end
end


p rotate_matrix([[1,2,3],[4,5,6],[7,8,9]])
