# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
  return board if board.empty?
  row, col = click
  if board[row][col] == 'M'
    board[row][col] = 'X'
  else
    reveal(board, row, col)
  end
  board
end

def reveal(board, row, col)
  return if board[row][col] != 'E'
  count = 0
  neighbours(board, row, col) do |n_row, n_col|
    count += 1 if board[n_row][n_col] == 'M'
  end
  if count.zero?
    board[row][col] = 'B'
    neighbours(board, row, col) do |n_row, n_col|
      reveal(board, n_row, n_col)
    end
  else
    board[row][col] = count.to_s
  end
end

def neighbours(board, row, col)
  [-1, 0, 1].each do |row_inc|
    [-1, 0, 1].each do |col_inc|
      next if row_inc == 0 && col_inc == 0
      n_row, n_col = row + row_inc, col + col_inc
      next if n_row < 0 || n_col < 0 || n_row >= board.length || n_col >= board.first.length
      yield [n_row, n_col]
    end
  end
end

board = [['E', 'E', 'E', 'E', 'E'],
['E', 'E', 'M', 'E', 'E'],
['E', 'E', 'E', 'E', 'E'],
['E', 'E', 'E', 'E', 'E']]

click = [3,0]

p update_board board, click