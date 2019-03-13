class NumMatrix
  attr_accessor :matrix, :sum_matrix
  #     :type matrix: Integer[][]
  def initialize(matrix)
    self.matrix = matrix
    self.sum_matrix = matrix.length.times.collect{ matrix.first.length.times.collect { 0 } }
    0.upto(matrix.length - 1) do |row|
      0.upto(matrix.first.length - 1) do |col|
        if col.zero?
          sum_matrix[row][col] = matrix[row][col]
        else
          sum_matrix[row][col] = matrix[row][col] + sum_matrix[row][col - 1]
        end         
      end
    end
  end

  #     :type row: Integer
  #     :type col: Integer
  #     :type val: Integer
  #     :rtype: Void
  def update(row, col, val)    
    diff = val - matrix[row][col]
    matrix[row][col] = val
    matrix_row = sum_matrix[row]
    col.upto(matrix_row.length - 1) do |idx|
      matrix_row[idx] += diff
    end
  end

  #     :type row1: Integer
  #     :type col1: Integer
  #     :type row2: Integer
  #     :type col2: Integer
  #     :rtype: Integer
  def sum_region(row1, col1, row2, col2)
    row1.upto(row2).reduce(0) do |sum, row|
      if col1.zero?
        sum += sum_matrix[row][col2]
      else
        sum += sum_matrix[row][col2] - sum_matrix[row][col1 - 1]
      end
    end
  end
end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# obj.update(row, col, val)
# param_2 = obj.sum_region(row1, col1, row2, col2)

obj = NumMatrix.new([
  [3, 0, 1, 4, 2],
  [5, 6, 3, 2, 1],
  [1, 2, 0, 1, 5],
  [4, 1, 0, 1, 7],
  [1, 0, 3, 0, 5]
])
p obj.matrix
p obj.sum_region(2, 1, 4, 3)
obj.update(3, 2, 2)
p obj.matrix
p obj.sum_region(2, 1, 4, 3)