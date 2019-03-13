# https://leetcode.com/problems/sudoku-solver/

# def solve(board, cache)
#   0.upto(8) do |row|
#     0.upto(8) do |col|
#       if board[row][col] != '.'
#         cache[row].delete(col) if cache[row]
#         cache.delete(row) if cache[row] && cache[row].empty?
#         next
#       end
#       row_nums = get_unsolved_row(board, row)
#       col_nums = get_unsolved_col(board, col)
#       box_nums = get_unsolved_box(board, row / 3 + col / 3)
#       possible = row_nums & col_nums & box_nums
#       if possible.length == 1
#         board[row][col] = possible.first
#         return true
#       end
#       cache[row] ||= {}
#       cache[row][col] = possible.to_a
#     end
#   end
#   false
# end


# def solve(board, cache)
#   0.upto(8) do |row|
#     0.upto(8) do |col|
#       next if board[row][col] != '.'
#       options = cache[row][col]
#       return false if options.empty?
#       options.each do |option|
#         board[row][col] = option
#         return true if solve(board, cache)
#         board[row][col] = '.'
#       end
#     end
#   end
#   true
# end
require 'set'
NUMS = %w[1 2 3 4 5 6 7 8 9]

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  solve(board, build_possibilities_cache(board))
end

def build_possibilities_cache(board)
  cache = {rows: [], cols: [], boxes: []}
  0.upto(8) do |idx|
    cache[:rows][idx] = get_unsolved_row(board, idx)
    cache[:cols][idx] = get_unsolved_col(board, idx)
    cache[:boxes][idx] = get_unsolved_box(board, idx)
  end
  cache
end

def cell_to_row_col_box(cell)
  row = cell / 9
  col = cell % 9  
  box = col / 3  + (row / 3) * 3
  [row, col, box]
end

def solve(board, cache, cell = 0)
  return true if cell > 80
  row = cell / 9
  col = cell % 9
  return solve(board, cache, cell + 1) if board[row][col] != '.'
  box = col / 3  + (row / 3) * 3
  row_nums = cache[:rows][row] || Set.new
  col_nums = cache[:cols][col] || Set.new
  box_nums = cache[:boxes][box] || Set.new
  possible = row_nums & col_nums & box_nums
  return false if possible.empty?
  possible.each do |possibility|
    cache[:rows][row].delete(possibility)
    cache[:cols][col].delete(possibility)
    cache[:boxes][box].delete(possibility)
    board[row][col] = possibility
    return true if solve(board, cache, cell + 1)
    board[row][col] = '.'
    cache[:rows][row].add(possibility)
    cache[:cols][col].add(possibility)
    cache[:boxes][box].add(possibility)
  end
  false
end

def get_unsolved_row(board, row)
  Set.new(NUMS - board[row])
end

def get_unsolved_col(board, col)
  Set.new(NUMS - 0.upto(board.length - 1).collect {|row| board[row][col] })
end

def get_unsolved_box(board, box)
  row = (box / 3) * 3
  col = (box % 3) * 3
  nums = []
  row.upto(row + 2) do |row|
    col.upto(col + 2) do |col|
      next if board[row][col] == '.'
      nums << board[row][col]
    end
  end
  Set.new(NUMS - nums)
end

board = 
[["5","3",".",".","7",".",".",".","."],
["6",".",".","1","9","5",".",".","."],
[".","9","8",".",".",".",".","6","."],
["8",".",".",".","6",".",".",".","3"],
["4",".",".","8",".","3",".",".","1"],
["7",".",".",".","2",".",".",".","6"],
[".","6",".",".",".",".","2","8","."],
[".",".",".","4","1","9",".",".","5"],
[".",".",".",".","8",".",".","7","9"]]

p solve_sudoku board

p board