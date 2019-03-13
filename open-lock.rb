# @param {String[]} deadends
# @param {String} target
# @return {Integer}

def get_prev(chr)
  return "9" if chr == "0"
  (chr.ord - 1).chr
end

def get_next(chr)
  return "0" if chr == "9"
  (chr.ord + 1).chr
end

def neighbours(current)
  current = current.chars
  neighbours = []
  current.each_with_index do |chr, idx|
    current[idx] = get_next(chr)
    neighbours.push(current.join)
    current[idx] = get_prev(chr)
    neighbours.push(current.join)
    current[idx] = chr
  end
  neighbours
end

def open_lock(deadends, target)
  visited = Set.new(deadends)
  return -1 if visited.include?("0000")
  queue = [["0000", 0]]
  visited.add("0000")
  while !queue.empty?
    num, moves = queue.shift
    return moves if num == target
    neighbours(num).each do |next_num|
      next if visited.include?(next_num)
      visited.add(next_num)
      queue.push([next_num, moves + 1])
    end
  end
  -1
end

p open_lock ["0201", "0101", "0102", "1212", "2002"], "0202"
