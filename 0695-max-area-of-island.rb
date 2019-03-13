# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  max_area = 0
  0.upto(grid.length - 1) do |x|
    0.upto(grid.first.length - 1) do |y|
      current_area = area_of_island(grid, x, y)
      max_area = current_area if current_area > max_area
    end
  end
  max_area
end 

def area_of_island(grid, x, y)
  return 0 if x < 0 || x >= grid.size || y < 0 || y >= grid.first.size || grid[x][y] != 1
  grid[x][y] = 0
  1 + area_of_island(grid, x + 1, y) + area_of_island(grid, x, y + 1) + area_of_island(grid, x - 1, y) + area_of_island(grid, x, y - 1)
end

p max_area_of_island([[1,1,0,0,0],[1,1,0,0,0],[0,0,0,1,1],[0,0,0,1,1]])