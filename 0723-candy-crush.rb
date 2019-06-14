# @param {Integer[][]} board
# @return {Integer[][]}
def candy_crush(board)
  loop do
    return if round(board)
  end
end

def round(board)
  0.upto(board.length - 1) do |row|
    0.upto(board.length - 1) do |row|
      cell_count = get_cell_count(board, row, col)
      if cell_count >= 3
        start_crushing(board, row, col)
        return false
      end
    end
  end
  true
end

def cell_column_count(board, row, col, color)
  return [0, 0] if row < 0 || row > board.length || col < 0 || col > board.first.length || board[row][col] != color
  cells = 1
  cells += 1
end

def crush_column(board, col)
  j, k = board.length - 1, board.length - 1
  while k >= 0
    while 
  end
end