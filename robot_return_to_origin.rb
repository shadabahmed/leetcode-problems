MOVE_MAP = {
  'U' => [0, 1],
  'D' => [0, -1],
  'L' => [-1, 0],
  'R' => [1, 0],
}
# @param {String} moves
# @return {Boolean}
def judge_circle(moves)
  x_moves, y_moves = 0, 0
  moves.each_char do |move|
    x_move, y_move = MOVE_MAP[move]
    x_moves += x_move
    y_moves += y_move
  end
  x_moves.zero? && y_moves.zero?  
end

p judge_circle 'LL'