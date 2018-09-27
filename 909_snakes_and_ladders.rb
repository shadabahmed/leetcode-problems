MAX_MOVES = 1000
# @param {Integer[][]} board
# @return {Integer}
def snakes_and_ladders(board)
  dp = board.length.times.collect{ [MAX_MOVES] * board.length }
  set(dp, 1, 0)
  2.upto(board.length * board.length) do |current_cell|
    jump_cell = get(board, current_cell)
    if current_cell <= 6
      current_cell_val = 1
    else
      min = MAX_MOVES
      1.upto(6) do |dice|
        prev_val = get(dp, current_cell - dice)
        min = prev_val if prev_val < min
      end
      current_cell_val = get(dp, current_cell)
      current_cell_val = min + 1 if current_cell_val > min
    end
    set(dp, current_cell, current_cell_val)
    
    if jump_cell > 0 && jump_cell > current_cell
      set(dp, jump_cell, current_cell_val)
    elsif jump_cell > 0
      set(dp, current_cell, MAX_MOVES)
    end
  end
  dp.each {|r| p r}
  min_moves = get(dp, board.length * board.length)
  min_moves == MAX_MOVES ? -1 : min_moves
end

def cell_to_row_col(cell_no, board)
  cell_no -= 1
  row = board.length - 1 - cell_no / board.length
  col = cell_no % board.length
  col = board.length - 1 - col if (board.length - row) % 2 == 0
  [row, col]
end

def get(grid, cell_no)
  row, col = cell_to_row_col(cell_no, grid)
  grid[row][col]
end

def set(grid, cell_no, val)
  row, col = cell_to_row_col(cell_no, grid)
  grid[row][col] = val
end

def snakes_and_ladders(board)
  visited = {}
  queue = [[1, -1, 0]]
  max_cell = board.length * board.length
  while !queue.empty?
    cell, jump, moves = queue.shift
    cell = jump if jump > 0
    return moves if cell == max_cell
    1.upto(6) do |dice|
      next_cell = cell + dice
      next if visited[next_cell] || next_cell > max_cell
      visited[next_cell] = true
      queue.push([next_cell, get(board, next_cell), moves + 1])
    end
  end
  -1
end

p snakes_and_ladders([[-1,-1,-1,-1,-1,-1],
[-1,-1,-1,-1,-1,-1],
[-1,-1,-1,-1,-1,-1],
[-1,35,-1,-1,13,-1],
[-1,-1,-1,-1,-1,-1],
[-1,15,-1,-1,-1,-1]])

p snakes_and_ladders [[-1,-1,-1],[-1,9,8],[-1,8,9]]


p snakes_and_ladders [[1,1,-1],
                      [1,1,1],
                      [-1,1,1]]

p snakes_and_ladders [[-1,4,-1],
                      [6,2,6],
                      [-1,3,-1]]                      

p snakes_and_ladders [[-1,1,2,-1],
                      [2,13,15,-1],
                      [-1,10,-1,-1],
                      [-1,6,2,8]]                      

p snakes_and_ladders [[-1,-1,2,21,-1],[16,-1,24,-1,4],[2,3,-1,-1,-1],[-1,11,23,18,-1],[-1,-1,-1,23,-1]]                      

p snakes_and_ladders [[-1,-1],[-1,3]]