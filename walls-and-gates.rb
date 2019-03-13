# @param {Integer[][]} rooms
# @return {Void} Do not return anything, modify rooms in-place instead.
INF = 2147483647

def bfs(rooms, start_row, start_col)
  max_row = rooms.length
  max_col = rooms.first.length
  queue = [[start_row, start_col, 0]]
  while !queue.empty?
    row, col, dist = queue.shift
    dist = 0 if rooms[row][col].zero?
    rooms[row][col] = dist if rooms[row][col] > dist
    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |inc_row, inc_col|
      next_row, next_col = row + inc_row, col + inc_col
      next if next_row < 0 || next_row >= max_row
      next if next_col < 0 || next_col >= max_col
      next if rooms[next_row][next_col] <= dist
      queue.push([next_row, next_col, dist + 1])
    end
  end
end

def walls_and_gates(rooms)
  0.upto(rooms.length - 1) do |row|
    0.upto(rooms.first.length - 1) do |col|
      if rooms[row][col].zero?
        bfs(rooms, row, col)
      end
    end
  end
  rooms
end

def bfs(rooms, queue)
  max_row = rooms.length
  max_col = rooms.first.length
  while !queue.empty?
    row, col, dist = queue.shift
    rooms[row][col] = dist if rooms[row][col] > dist
    [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |inc_row, inc_col|
      next_row, next_col = row + inc_row, col + inc_col
      next if next_row < 0 || next_row >= max_row
      next if next_col < 0 || next_col >= max_col
      next if rooms[next_row][next_col] < dist
      queue.push([next_row, next_col, dist + 1])
    end
  end
end

def walls_and_gates(rooms)
  0.upto(rooms.length - 1) do |row|
    0.upto(rooms.first.length - 1) do |col|
      if rooms[row][col].zero?
        queue.push([row, col, 0])
      end
    end
  end
  bfs(rooms, queue)
  rooms
end

rooms = [[INF, -1, 0, INF],
         [INF, INF, INF, -1],
         [INF, -1, INF, -1],
         [0, -1, INF, INF]]
rooms = [[-1, 2147483647, 0, 2147483647, -1, 2147483647, -1, -1, -1, 0, 0, 2147483647, -1, 0, 0, 0, 0, 0, -1, 0, 0, 2147483647, 0, 2147483647, 2147483647, -1, 2147483647, -1, 2147483647, -1, -1, -1, 0]]
walls_and_gates rooms
rooms.each { |r| p r }
[[-1, 1, 0, 1, -1, 2147483647, -1, -1, -1, 0, 0, 1, -1, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 1, 2, -1, 2147483647, -1, 2147483647, -1, -1, -1, 0]]
