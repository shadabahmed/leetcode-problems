class SnakeGame
  attr_accessor :snake, :width, :height, :score, :food, :food_cell
  def initialize(width, height, food)
    self.width = width
    self.height = height
    self.snake = [[0, 0]]
    self.score = 0
    self.food = food
    add_food
  end

  def move(direction)
    row, col = next_cell(direction)
    return -1 if out_of_bounds?(row, col)
    snake.push([row, col])
    if food_cell && food_cell[0] == row && food_cell[1] == col
      self.score += 1
      add_food
    else
      snake.shift
    end    
    return -1 if hit_self?(row, col)
    self.score
  end

  def out_of_bounds?(row, col)
    row < 0 || row >= height || col < 0 || col >= width
  end

  def hit_self?(row, col)
    0.upto(snake.length - 2).any?{|idx| snake[idx] == snake.last}
  end

  def next_cell(direction)
    row, col = snake.last
    case direction
    when 'U' then [row - 1, col]
    when 'D' then [row + 1, col]
    when 'L' then [row, col - 1]
    when 'R' then [row, col + 1]
    end
  end

  def add_food
    self.food_cell = nil
    return if food.empty?
    self.food_cell = food.shift
  end
end
