#
#
# def spiral_order(matrix)
#   return if matrix.length.zero?
#   m, n = matrix.length - 1, matrix.first.length - 1
#   row, col, res = 0, 0, []
#   while row <= m / 2 && col <= n / 2
#     # p "////////////////////////////"
#     # p [row, col]
#     # p [col, n - col]
#     # p [row + 1, m - row - 1]
#     # p [n - col, col + 1]
#     # p [m - row, row + 1]
#     # p "////////////////////////////"
#     if col != n - col
#       col.upto(n - col) do |idx|
#         res.push(matrix[row][idx])
#       end
#     end
#
#     if row != m - row
#       (row + 1).upto(m - row - 1) do |idx|
#         res.push(matrix[idx][n - col])
#       end
#     end
#
#     if col != n - col
#       (n - col).downto(col + 1) do |idx|
#         res.push(matrix[m - row][idx])
#       end
#     end
#
#     if row != m - row
#       (m - row).downto(row + 1) do |idx|
#         res.push(matrix[idx][col])
#       end
#     end
#     row += 1
#     col += 1
#   end
#   res
# end


def spiral_order(matrix)
  return if matrix.length.zero?
  m, n = matrix.length - 1, matrix.first.length - 1
  gap, res = 0, []
  while gap <= m - gap && gap <= n - gap
    gap.upto(n - gap) do |col_idx|
      res.push(matrix[gap][col_idx])
    end

    (gap + 1).upto(m - gap) do |row_idx|
      res.push(matrix[row_idx][n - gap])
    end

    (n - gap - 1).downto(gap) do |col_idx|
      next if gap == m - gap
      res.push(matrix[m - gap][col_idx])
    end

    (m - gap - 1).downto(gap + 1) do |row_idx|
      next if gap == n - gap
      res.push(matrix[row_idx][gap])
    end
    gap += 1
  end
  res
end
p spiral_order [[1,2,3],[4,5,6],[7,8,9]]

p spiral_order [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
