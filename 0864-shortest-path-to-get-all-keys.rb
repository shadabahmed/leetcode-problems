# @param {String[]} grid
# @return {Integer}
def shortest_path_all_keys(grid)
  return -1 if grid.empty?
  start_row, start_col, target_keys = get_starting_point(grid)
  queue = [[start_row, start_col, 0, 0]]
  visited = Set.new
  while !queue.empty?
    row, col, dist, keys = queue.shift
    current = grid[row][col]
    keys = set_key(keys, current) if is_key?(current)
    return dist if keys == target_keys    
    neighbours(grid, row, col) do |n_row, n_col|
      neighbour = grid[n_row][n_col]
      n_key = "#{n_row},#{n_col},#{keys}"
      next if visited.include?(n_key) || neighbour == '#'
      next if is_door?(neighbour) && !can_unlock?(keys, neighbour)
      visited.add(n_key)
      queue.push([n_row, n_col, dist + 1, keys])
    end
  end
  -1
end

def get_starting_point(grid)
  start_row, start_col, target_keys = 0, 0, 0
  0.upto(grid.length - 1) do |row|
    0.upto(grid[row].length - 1) do |col|
      current = grid[row][col]
      if is_key?(current)
        target_keys = set_key(target_keys, current) 
      elsif current == '@'
        start_row, start_col = row, col
      end
    end
  end
  return [start_row, start_col, target_keys]
end

def set_key(keys, key)
  keys | (1 << key.ord - 97)
end

def is_key?(char)
  char.ord >= 97 && char.ord <= 102
end

def is_door?(char)
  char.ord >= 65 && char.ord <= 70
end

def can_unlock?(keys, door)
  keys & (1 << door.ord - 65) > 0
end

def neighbours(grid, row, col)
  yield [row - 1, col] if row > 0
  yield [row + 1, col] if row < grid.length - 1
  yield [row, col - 1] if col > 0
  yield [row, col + 1] if grid.length > 0 && col < grid.first.length - 1
end

# p shortest_path_all_keys ["@.a.#","###.#","b.A.B"]

p shortest_path_all_keys ["@..aA","..B#.","....b"]

p shortest_path_all_keys ["@...a",".###A","b.BCc"]

p shortest_path_all_keys ["@#b#",
                          "..#.",
                          "aAB."]