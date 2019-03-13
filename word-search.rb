# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def dfs(board, row, col, word, idx, visited)
  return false if row < 0 || row >= board.length || col < 0 || col >= board.first.length
  return false if board[row][col] != word[idx]
  return true if idx == word.length - 1
  [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |row_inc, col_inc|
    next_row, next_col = row + row_inc, col + col_inc
    next if visited[next_row][next_col]
    visited[next_row][next_col] = true
    return true if dfs(board, next_row, next_col, word, idx + 1, visited)
    visited[next_row][next_col] = false
  end
  false
end

def exist(board, word)
  0.upto(board.length - 1) do |row|
    0.upto(board[row].length - 1) do |col|
      next if board[row][col] != word[0]
      hash = Hash.new { |h, k| h[k] = {} }
      hash[row][col] = true
      return true if dfs(board, row, col, word, 0, hash)
    end
  end
  false
end

# board =
#   [
#     ["A", "B", "C", "E"],
#     ["S", "F", "C", "S"],
#     ["A", "D", "E", "E"],
#   ]

# p exist board, "ABCCED"
# p exist board, "SEE"
# p exist board, "ABCB"
# p exist board, "ABCESEEEFS"

board = [["A", "B", "C", "E"],
         ["S", "F", "E", "S"],
         ["A", "D", "E", "E"]]

p exist board, "ABCESEEEFS"
