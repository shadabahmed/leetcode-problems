require 'pry'

def create_path_table(dungeon, max_row, max_col)
  table = dungeon.length.times.collect { dungeon.first.length.times.collect { 0 }}
  table[0][0] = dungeon[0][0]
  0.upto(max_row) do |row|
    0.upto(max_col) do |col|
      next if col == 0 && row == 0
      if col == max_col
        table[row][col] = dungeon[row][col] + table[row - 1][col]
      elsif row == max_row
        table[row][col] = dungeon[row][col] + table[row][col - 1]
      else
        table[row][col] = dungeon[row][col] + [table[row][col - 1], table[row - 1][col]].max
      end
    end
  end
  table
end

def create_reverse_path_table(dungeon, max_row, max_col)
  table = dungeon.length.times.collect { dungeon.first.length.times.collect { 0 }}
  table[max_row][max_col] = dungeon[max_row][max_col]
  max_row.downto(0) do |row|
    max_col.downto(0) do |col|
      next if col == max_col && row == max_row
      if col == max_col
        table[row][col] = dungeon[row][col] + table[row + 1][col]
      elsif row == max_row
        table[row][col] = dungeon[row][col] + table[row][col + 1]
      else
        table[row][col] = dungeon[row][col] + [table[row][col + 1], table[row + 1][col]].max
      end
    end
  end
  table
end

def get_min_on_path(dungeon, table, rev_table, max_row, max_col)
  min_hp = 1
  current_hp = 0
  row, col = 0, 0
  while row <= max_row && col <= max_col
    current_hp += dungeon[row][col]
    min_hp = [current_hp, min_hp].min
    if row == max_row
      col += 1
    elsif col == max_col
      row += 1
    elsif rev_table[row + 1][col] + table[row + 1][col] > rev_table[row][col + 1] + table[row][col + 1]
      row += 1
    else
      col += 1
    end
  end
  p min_hp
  min_hp
end

def calculate_minimum_hp(dungeon)
  max_row, max_col = dungeon.length - 1, dungeon.first.length - 1
  table = create_path_table(dungeon, max_row, max_col)
  rev_table = create_reverse_path_table(dungeon, max_row, max_col)
  p table
  p rev_table
  min_hp = get_min_on_path(dungeon, table, rev_table, max_row, max_col)
  min_hp < 0 ? 1 - min_hp : 1
end

def calculate_minimum_hp(dungeon)
  max_row, max_col = dungeon.length - 1, dungeon.first.length - 1
  table = (max_row + 1).times.collect { (max_col + 1).times.collect {0}}
  table[max_row][max_col] = [0, -1 * dungeon[max_row][max_col]].max + 1
  max_row.downto(0) do |row|
    max_col.downto(0) do |col|
      next if col == max_col && row == max_row
      if col == max_col
        table[row][col] = table[row + 1][col] - dungeon[row][col]
      elsif row == max_row
        table[row][col] = table[row][col + 1] - dungeon[row][col]
      else
        table[row][col] = [table[row][col + 1], table[row + 1][col]].min - dungeon[row][col]
      end
      if table[row][col] <= 0
        table[row][col] = 1
      end
    end
  end
  table[0][0]
end

p calculate_minimum_hp [[-2,-3,3],[-5,-10,1],[10,30,-5]]
p calculate_minimum_hp [[3,-20,30],[-3,4,0]]
p calculate_minimum_hp [[-3,5]]
p calculate_minimum_hp [[1,-3,3], [0,-2,0], [-3,-3,-3]]
