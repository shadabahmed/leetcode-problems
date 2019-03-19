# @param {Integer[][]} grid
# @return {Integer}
def shortest_distance(grid)
  distances = grid.length.times.collect { grid.first.length.times.collect { -1 } }
  0.upto(grid.length - 1) do |row|
    0.upto(grid[row].length - 1) do |col|
      bfs(grid, row, col, distances) if grid[row][col] == 1
    end
  end
  min_dist = -1
  distances.each do |dist_row|
    dist_row.each do |dist|
      if dist != -1
        if min_dist == -1
          min_dist = dist
        elsif dist < min_dist
          min_dist = dist
        end
      end
    end
  end
  min_dist
end

def bfs(grid, row, col, distances)
  visited = Hash.new{|h,k| h[k] = {}}
  queue = [[row, col, 0]]
  visited[row][col] = true
  while !queue.empty?
    row, col, dist = queue.shift
    if grid[row][col] == 0
      distances[row][col] = 0 if distances[row][col] == -1 && grid[row][col]
      distances[row][col] += dist
    end
    [[0,1], [0, -1], [1,0], [-1, 0]].each do |row_inc, col_inc|
      nrow, ncol = row_inc + row, col_inc + col
      next if nrow < 0 || nrow >= grid.length || ncol < 0 || ncol >= grid.first.length || visited[nrow][ncol] || grid[nrow][ncol] != 0
      visited[nrow][ncol] = true
      queue.push([nrow, ncol, dist + 1])
    end
  end
end


p shortest_distance [[0,2,1],[1,0,2],[0,1,0]]