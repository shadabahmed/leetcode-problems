# @param {Integer[]} commands
# @param {Integer[][]} obstacles
# @return {Integer}

DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]]

def process(command, obstacles, x, y, dir)
  if command == -2
    dir = (dir + 3) % 4
  elsif command == -1
    dir = (dir + 1) % 4
  else
    x_inc, y_inc = DIRS[dir]
    command.times do
      next_x, next_y = x + x_inc, y + y_inc
      break if obstacles[next_x] && obstacles[next_x][next_y]
      x, y = next_x, next_y
    end
  end
  [x, y, dir]
end

def robot_sim(commands, obstacles)
  cur_x, cur_y, dir, max = 0, 0, 0, 0
  obstacles = obstacles.reduce({}) do |map, (x, y)|
    map[x] ||= {}
    map[x][y] = true
    map
  end
  commands.each do |command|
    cur_x, cur_y, dir = process(command, obstacles, cur_x, cur_y, dir)
    cur_dist = cur_x * cur_x + cur_y * cur_y
    max = cur_dist if cur_dist > max
  end
  max
end
