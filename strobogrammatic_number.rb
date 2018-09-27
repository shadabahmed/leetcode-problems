# nUmbers like
# n = 1 - 0 1 8 9 6
# n = 2 - 11, 88, 96, 69
# n = 3 - 111, 101, 181, 161, 191, 808, 818, 916, 619, 909, 906, 609, 606, 666, 999
# n = 4 - 1111, 1001, 1881, 8118, 8888, 8008, 9696, 6969, 6009, 9006
# n = 6 - 96096

# observations, 0 can come either in middle or exclusive.
# 690069
STROBOMATIC_PAIRS = {1 => 1, 0 => 0, 6 => 9, 8 => 8, 9 => 6}
def find_strobogrammatic(n, stack = [], first = 0, last = n - 1, res = [])
  return res.push(stack.join) if first > last
  STROBOMATIC_PAIRS.keys.each do |num|
    # Larger than 1 digit, cannot start from 0
    next if num == 0 && first == 0 && n > 1
    # Middle element cannot be 6 or 9
    next if first == last && (num == 6 || num == 9)
    stack[first] = num
    stack[last] = STROBOMATIC_PAIRS[num]
    find_strobogrammatic(n, stack, first + 1, last - 1, res)
  end
  res
end

find_strobogrammatic 3
