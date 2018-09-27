def find_diagonal_order(matrix)
  return [] if matrix.empty?
  m, n = matrix.length - 1, matrix.first.length - 1
  res, up = [], true
  sum = 0
  while sum <= m + n
    if up
      col = sum > m ? sum - m : 0
      row = sum > m ? m : sum
      while row >= 0 && col <= n do
        res.push(matrix[row][col])
        col += 1
        row -= 1
      end
    else
      row = sum > n ? sum - n : 0
      col = sum > n ? n : sum
      while row <= m && col  >= 0 do
        res.push(matrix[row][col])
        col -= 1
        row += 1
      end
    end
    sum += 1
    up = !up
  end
  res
end
p find_diagonal_order([[1,2,3],[4,5,6],[7,8,9]])
