require 'set'

def all_points()
  arr = []
  0.upto(2) do |row|
    0.upto(2) do |col|
      arr << [row, col]
    end
  end
  arr
end

def neighbouring_positions(point)
  x , y = point
  if (x == 0 && (y == 0 || y == 2)) || (y == 2 && (x == 0 || x == 2))
    [[0,1], [1,0], [1,1], [1,2], [2,1]]
  elsif x == 1 && y == 1
    [[0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1], [2,2]]
  else
    z = [[0,0], [0,2], [1,1], [2,0], [2,2]]
    if y == 1
      z + [[1,0], [1,2]]
    else
      z + [[0,1], [2,1]]
    end
  end
end

def neighbours(point, visited)
  neighbouring_positions(point).collect do |n_point|
    if visited.include?(n_point)
      j_point = jump_neighbour(point, n_point)
      next if j_point.nil?
      j_point
    else
      n_point
    end
  end
end

def jump_neighbour(point, neighbour)
  x , y = point
  n_x, n_y = neighbour

  if y < n_y && n_y < 2
    n_y += 1
  elsif y > n_y && n_y > 0
    n_y -= 1
  end

  if x < n_x && n_x < 2
    n_x += 1
  elsif x > n_x && n_x > 0
    n_x -= 1
  end
  if [n_x, n_y] == neighbour
    nil
  else
    [n_x, n_y]
  end
end

def patterns_count(n, start = nil, visited = Set.new)
  return 1 if n == 0
  points = if start.nil?
            all_points
           else
             neighbours(start, visited)
           end
  sum = 0
  points.each do |point|
    visited.add(point)
    sum += patterns_count(n - 1, point, visited)
    visited.delete(point)
  end
  sum
end

def number_of_patterns(m, n)
  m.upto(n).reduce(0) do |sum, n|
    sum += patterns_count(n)
  end
end

p number_of_patterns 1,2
