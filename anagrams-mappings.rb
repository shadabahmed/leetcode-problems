# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def anagram_mappings(a, b)
  map = b.each_with_index.to_a.to_h
  a.collect { |num| map[num] }
end

A = [12, 28, 46, 32, 50]
B = [50, 12, 32, 46, 28]

p anagram_mappings A, B