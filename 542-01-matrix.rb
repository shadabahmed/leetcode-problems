# @param {Integer[][]} matrix
# @return {Integer[][]}
INFINITY = 1.0 / 0

def bfs(matrix, queue)
  max_row, max_col = matrix.length, matrix.first.length
  queue = [[start_row, start_col, 0]]
  while !queue.empty?
    row, col, dist = queue.shift
    matrix[row][col] = dist if matrix[row][col] > dist
    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |inc_row, inc_col|
      next_row, next_col = row + inc_row, col + inc_col
      next if next_row < 0 || next_row >= max_row
      next if next_col < 0 || next_col >= max_col
      next if matrix[row][col] < dist
      queue.push([next_row, next_col, dist + 1])
    end
  end
end

def bfs(matrix, queue)
  max_row = matrix.length
  max_col = matrix.first.length
  while !queue.empty?
    row, col, dist = queue.shift
    matrix[row][col] = dist if matrix[row][col] > dist
    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |inc_row, inc_col|
      next_row, next_col = row + inc_row, col + inc_col
      next if next_row < 0 || next_row >= max_row
      next if next_col < 0 || next_col >= max_col
      next if matrix[next_row][next_col] <= dist
      queue.push([next_row, next_col, dist + 1])
    end
  end
end

def update_matrix(matrix)
  queue = []
  0.upto(matrix.length - 1) do |row|
    0.upto(matrix[row].length - 1) do |col|
      if matrix[row][col].zero?
        queue.push([row, col, 0])
      else
        matrix[row][col] = INFINITY
      end
    end
  end
  bfs(matrix, queue)
  matrix
end

p update_matrix [[0, 0, 0], [0, 1, 0], [1, 1, 1]]
p update_matrix [[0, 1, 0], [0, 1, 0], [0, 1, 0], [0, 1, 0], [0, 1, 0]]
