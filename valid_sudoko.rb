def valid_square(board, square_num)
  check = []
  row_start = (square_num / 3) * 3
  col_start = (square_num % 3) * 3
  row_start.upto(row_start + 2) do |row|
    col_start.upto(col_start + 2) do |col|
      next if board[row][col] == '.'
      num = board[row][col].ord - 49
      return false if check[num]
      check[num] = true
    end
  end
end

def valid_col(board, col)
  check = []
  0.upto(8) do |row|
    next if board[row][col] == '.'
    num = board[row][col].ord - 49
    return false if check[num]
    check[num] = true
  end
  true
end

def valid_row(board, row)
  check = []
  0.upto(8) do |col|
    next if board[row][col] == '.'
    num = board[row][col].ord - 49
    return false if check[num]
    check[num] = true
  end
  true
end

def is_valid_sudoku(board)
  0.upto(8).all? |start|
    valid_col?(board, start) && valid_row?(board, start) && valid_square(board,start)
  end
end
