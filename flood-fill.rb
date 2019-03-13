def neighbours(image, starting_color, row, col)
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |tx, ty|
    n_row = row + tx
    n_col = col + ty
    next if n_row < 0 || n_row >= image.length
    next if n_col < 0 || n_col >= image.first.length
    next if image[n_row][n_col] != starting_color
    yield [n_row, n_col]
  end
end

def flood_fill(image, sr, sc, new_color)
  queue = [[sr, sc]]
  starting_color = image[sr][sc]
  while !queue.empty?
    row, col = queue.shift
    image[row][col] = new_color
    neighbours(image, starting_color, row, col) do |nr, nc|
      next if image[nr][nc] == new_color
      visited[nr][nc] = true
      queue.push([nr, nc])
    end
  end
  image
end

def flood_fill_helper(image, row, col, parent_color, new_color)
  return if row < 0 || col < 0 || row >= image.length || col >= image.first.length
  return if image[row][col] != parent_color || image[row][col] == new_color
  image[row][col] = new_color
  flood_fill_helper(image, row + 1, col, parent_color, new_color)
  flood_fill_helper(image, row - 1, col, parent_color, new_color)
  flood_fill_helper(image, row, col + 1, parent_color, new_color)
  flood_fill_helper(image, row, col - 1, parent_color, new_color)
end

def flood_fill(image, sr, sc, new_color)
  flood_fill_helper(image, sr, sc, image[sr][sc], new_color)
  image
end

image = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]
sr = 1
sc = 1
newColor = 2

p flood_fill image, sr, sc, newColor
p image

p flood_fill [[0, 0, 0], [0, 1, 1]], 1, 1, 1
