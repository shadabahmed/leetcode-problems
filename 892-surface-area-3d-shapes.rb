#https://leetcode.com/problems/surface-area-of-3d-shapes/

# @param {Integer[][]} grid
# @return {Integer}
def surface_area(grid)
  area = 0
  0.upto(grid.length - 1) do |row|
    0.upto(grid[row].length - 1) do |col|
      [[0,1],[0,-1],[1,0],[-1,0]].each do |x, y|
        n_row, n_col = row + x, col + y
        if n_row < grid.length && n_row >= 0 && n_col < grid[row].length && n_col >= 0
          if grid[n_row][n_col] < grid[row][col]
            area += grid[row][col] - grid[n_row][n_col]
          end
        else
          area += grid[row][col]
        end        
      end
      area += 2 if grid[row][col] > 0
    end
  end
  area
 end

 p surface_area [[1,0],[0,2]]
 p surface_area [[1,2],[3,4]]

 p surface_area([[2]])

 p surface_area [[2,2,2],[2,1,2],[2,2,2]]