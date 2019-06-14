# @param {Integer} n
# @return {Integer}
def total_n_queens(n)
  board = n.times.collect{n.times.collect{ false }}
  count_config(board, 0)
end

def count_config(board, col)
  p col
  return 1 if col >= board.length
  count = 0
  max = col == 0 ? board.length / 2 - 1 : board.length - 1
  0.upto(max) do |row|
    board[row][col] = true
    if valid_board(board, row, col)
      count += count_config(board, col + 1)
    end
    board[row][col] = false
  end
  count
end

def valid_board(board, row, col)
  # left
  return false if (col - 1).downto(0).any?{|col| board[row][col]}
  # diagonals
  (col - 1).downto(0) do |other_col|
    down_row = row + (col - other_col)
    up_row = row - (col - other_col)
    return false if board[down_row][other_col] if down_row < board.length    
    return false if board[up_row][other_col] if up_row >= 0
  end
  true
end

p total_n_queens(8)