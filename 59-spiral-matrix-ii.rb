# https://leetcode.com/problems/spiral-matrix-ii/

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  matrix = n.times.collect{n.times.collect{nil}}
  k = 1
  next_cell(0,0, n - 1, n - 1) do |row, col|
    matrix[row][col] = k
    k += 1
  end
  matrix
end

def next_cell(row, col, max_row, max_col)
  loop do 
    col.upto(max_col) do |col|
      yield [row, col]
    end
    (row + 1).upto(max_row) do |row|
      yield [row, max_col]
    end
    max_col -= 1
    (max_col).downto(col) do |col|
      yield [max_row, col]
    end
    max_row -= 1
    row += 1
    (max_row).downto(row) do |row|
      yield [row, col]
    end    
    col += 1
    return if row > max_row || col > max_col
  end   
end

# def fill(matrix, start_x, start_y, end_x, end_y, n)
#   n = fill_row(matrix, start_x, end_x, start_y, n)
#   # single cell
#   return if start_x == end_x && start_y == end_y
#   n = fill_col(matrix, start_y + 1, end_y, end_x, n)
#   # single col
#   return if start_x == end_x
#   n = fill_row(matrix, end_x - 1, start_x, end_y, n)
#   fill_col(start_x, end_y - 1, , start_y + 1, n)
# end

# def fill_row(start_x, end_x, y, n)
#   if end_x > start_x
#     end_x.downto(start_x) do |x|

#       n += 1
#     end
#   else
#   end
#   n
# end

p generate_matrix(3)