# @param {Character[][]} board
# @return {Integer}
def num_rook_captures(board)
  0.upto(7) do |row|
    0.upto(7) do |col|
      return available_pawns(board, row, col) if board[row][col] == 'R'
    end
  end
end

def available_pawns(board, row, col)
  sum = 0
  (row - 1).downto(0) do |row|
    next if board[row][col] == '.'
    sum += 1 if board[row][col] == 'p'
    break
  end

  (row + 1).upto(7) do |row|
    next if board[row][col] == '.'
    sum += 1 if board[row][col] == 'p'
    break
  end

  (col - 1).downto(0) do |col|
    next if board[row][col] == '.'
    sum += 1 if board[row][col] == 'p'
    break
  end

  (col + 1).upto(7) do |col|
    next if board[row][col] == '.'
    sum += 1 if board[row][col] == 'p'
    break
  end

  sum
end

p num_rook_captures [[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]]