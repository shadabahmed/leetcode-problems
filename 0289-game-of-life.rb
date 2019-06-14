# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  pop = board.length.times.collect{ board.first.length.times.collect { 0 }}
  0.upto(board.length - 1) do |row|
    0.upto(board.first.length - 1) do |col|
      if board[row][col] == 1
        if row > 0
          pop[row - 1][col] += 1
          pop[row - 1][col - 1] += 1 if col > 0
          pop[row - 1][col + 1] += 1 if col < board.first.length - 1
        end
        pop[row][col - 1] += 1 if col > 0
        pop[row][col + 1] += 1 if col < board.first.length - 1
        if row < board.length - 1
          pop[row + 1][col] += 1
          pop[row + 1][col - 1] += 1 if col > 0
          pop[row + 1][col + 1] += 1 if col < board.first.length - 1
        end
      end
    end
  end
  0.upto(board.length - 1) do |row|
    0.upto(board.first.length - 1) do |col|
      if board[row][col] == 0 && pop[row][col] == 3
        board[row][col] = 1
      elsif board[row][col] == 1 && pop[row][col] < 2 || pop[row][col] > 3
        board[row][col] = 0
      end
    end
  end
  board
end

p game_of_life [
  [0,1,0],
  [0,0,1],
  [1,1,1],
  [0,0,0]
]