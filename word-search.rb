# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  res = false
  0.upto(board.length - 1) do |row|
    0.upto(board[0].length - 1) do |col|      
      res ||= dfs(board, word, row, col, 0)
      return true if res == true
    end
  end
  res
end


def dfs(board, word, row, col, idx, visited = {})
  return false if row < 0 || row >= board.length || col < 0 || col >= board[0].length || board[row][col] != word[idx] || visited[row] && visited[row][col]
  visited[row] ||= {}
  visited[row][col] = true
  return true if idx == word.length - 1
  res = dfs(board, word, row, col + 1, idx + 1, visited) ||    
  dfs(board, word, row, col - 1, idx + 1, visited) ||
  dfs(board, word, row + 1, col, idx + 1, visited) ||
  dfs(board, word, row - 1, col, idx + 1, visited)
  visited[row][col] = false if !res
  res
end

board =
[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]

p exist(board, 'ABCCED')

p exist(["A"], "AB")

board = [["A","B","C","E"],
         ["S","F","E","S"],
         ["A","D","E","E"]]
word = "ABCESEEEFS"

p exist(board, word)