# @param {String} s
# @param {String} t
# @return {String}
def custom_sort_string(s, t)
  map = Hash.new(0)
  t.each_char do |chr|
    map[chr] += 1
  end
  p = ''
  s.each_char do |chr|
    p << chr * map[chr]
    map.delete(chr)
  end
  map.each do |chr, count|
    p << chr * count
  end
  p
end
