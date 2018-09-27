class TicTacToe
  #  Initialize your data structure here.
  #  :type n: Integer
  attr_accessor :line_map, :player1_map, :player2_map, :n
  def initialize(n)
    self.n = n
    self.player1_map = Hash.new(0)
    self.player2_map = Hash.new(0)
  end

  def get_lines(row, col)
    lines = [row, n + col]
    lines << 2 * n if row == col
    lines << 2 * n + 1 if row + col == n - 1
    lines
  end

  # Player {player} makes a move at ({row}, {col}).
  #     @param row The row of the board.
  #     @param col The column of the board.
  #     @param player The player, can be either 1 or 2.
  #     @return The current winning condition, can be either:
  #             0: No one wins.
  #             1: Player 1 wins.
  #             2: Player 2 wins.
  # :type row: Integer
  # :type col: Integer
  # :type player: Integer
  # :rtype: Integer
  def move(row, col, player)
    player_map = player == 1 ? player1_map : player2_map
    opponent_map = player == 2 ? player1_map : player2_map
    get_lines(row, col).each do |line|
      player_map[line] += 1
      opponent_map[line] -= 1
      return player if player_map[line] == n      
    end
    0
  end
end

# Your TicTacToe object will be instantiated and called as such:
# obj = TicTacToe.new(n)
# param_1 = obj.move(row, col, player)

# game 1, 0, 0, lines_map
# p lines_map
# game 1, 1, 0, lines_map
# p lines_map
# game 1, 2, 0, lines_map
# p lines_map

toe = TicTacToe.new(3)
p toe.line_map

p toe.move(0, 0, 1)# -> Returns 0 (no one wins)
# |X| | |
# | | | |    // Player 1 makes a move at (0, 0).
# | | | |

p toe.move(0, 2, 2)# -> Returns 0 (no one wins)
# |X| |O|
# | | | |    // Player 2 makes a move at (0, 2).
# | | | |

p toe.move(2, 2, 1)# -> Returns 0 (no one wins)
# |X| |O|
# | | | |    // Player 1 makes a move at (2, 2).
# | | |X|

p toe.move(1, 1, 2)# -> Returns 0 (no one wins)
# |X| |O|
# | |O| |    // Player 2 makes a move at (1, 1).
# | | |X|

p toe.move(2, 0, 1)# -> Returns 0 (no one wins)
# |X| |O|
# | |O| |    // Player 1 makes a move at (2, 0).
# |X| |X|

p toe.move(1, 0, 2)# -> Returns 0 (no one wins)
# |X| |O|
# |O|O| |    // Player 2 makes a move at (1, 0).
# |X| |X|

p toe.move(2, 1, 1)# -> Returns 1 (player 1 wins)
# |X| |O|
# |O|O| |    // Player 1 makes a move at (2, 1).
# |X|X|X|