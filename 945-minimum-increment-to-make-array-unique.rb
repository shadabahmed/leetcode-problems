# @param {Integer[]} a
# @return {Integer}
def min_increment_for_unique(a)
  count_map = Hash.new(0)
  max = a[0]
  moves = 0
  a.each do |num|
    count_map[num] += 1
    max = num if num > max
  end
  a.each_with_index do |num, index|
    slot = find_empty_slot(map, num, max)
    if slot != num
      count_map[num] -= 1
      count_map[slot] += 1
      moves += slot - num
    end
  end
  count
end

def moves_needed(count_map, num, max)
  return 0 if count_map[num] == 1
  count_map[num] -= 1
  moves = 1
  while count_map[num + moves] != 0
    moves += 1
  end
  count_map[num + moves] += 1
  moves
end

def find_empty_slot(map, num, max)
  return num if map[num].zero?
  while num < max
    
  end
end

p min_increment_for_unique [3,2,1,2,1,7]