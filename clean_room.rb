require 'pry'

def print_grid(grid)
  grid.each do |row|
    puts row.join(',')
  end
end
grid = [[1,1,1,1,1,0,1,1],[1,1,1,1,1,0,1,1],[1,0,1,1,1,1,1,1],[0,0,0,1,0,0,0,0],[1,1,1,1,1,1,1,1]]
class Robot
  attr_accessor :dir, :x, :y, :grid, :tx, :ty
  def initialize(grid, x, y)
    self.dir = 0
    self.grid = grid
    self.x = x
    self.y = y
  end

  def calculate_cell(tx, ty)
    [self.x + tx, self.y + ty]
  end

  def position()
    [self.x + self.tx, self.y + self.ty]
  end

  def turn_left()
    self.dir = (self.dir - 1) % 4
  end

  def turn_right()
    self.dir = (self.dir + 1) % 4
  end

  def move(tx, ty)
    row, col = self.calculate_cell(tx, ty)
    return false if row < 0 || col < 0 || row >= grid.length || col >= grid[0].length
    if grid[row][col] == 1 or grid[row][col] == 'C'
      self.tx = tx
      self.ty = ty
      return true
    end
    false
  end

  def clean(tx, ty)
    row, col = self.calculate_cell(tx, ty)
    return false if row < 0 || col < 0 || row >= grid.length || col >= grid[0].length
    grid[row][col] = 'C'
  end
end

class Solution
  def next_cell(x, y, dir)
    if dir == 0
      return [x - 1, y]
    elsif dir == 1
      return [x, y + 1]
    elsif dir == 2
      return [x + 1, y]
    elsif dir == 3
      return [x, y - 1]
    end
  end

  def next_cells(x,y,dir, visited, cleaned)
    cells = []
    0.upto(3) do |next_dir|
      next_dir = (dir + next_dir) % 4
      next_x, next_y = self.next_cell(x, y, next_dir)
      key = "#{next_x},#{next_y},#{next_dir}"
      next if visited.key?(key)
      if cleaned.key?("#{next_x},#{next_y}")
        cells.push([next_x, next_y, next_dir])
      else
        cells.unshift([next_x, next_y, next_dir])
      end
    end
    cells
  end


  def clean_room(robot)
    visited = {}
    cleaned = {}
    queue = [[0,0,0]]
    while !queue.empty?
      x, y, dir = queue.shift
      key = "#{x},#{y}"
      if !cleaned.key?(key)
        robot.clean(x, y)
        cleaned[key] = true
      end
      next_cells(x, y, dir, visited, cleaned).each do |(next_x, next_y, next_dir)|
        key = "#{next_x},#{next_y},#{next_dir}"
        if next_dir == (dir + 1) % 4
          robot.turn_right()
        elsif next_dir == (dir - 1) % 4
          robot.turn_left()
        elsif next_dir != dir
          robot.turn_left()
          robot.turn_left()
        end
        dir = next_dir
        visited[key] = true
        if robot.move(next_x, next_y)
          queue.push([next_x, next_y, dir])
          break
        end
      end
    end
  end
end


robot = Robot.new(grid, 1, 3)
puts '                         '
print_grid(grid)
Solution.new().clean_room(robot)
puts '                         '
print_grid(grid)
