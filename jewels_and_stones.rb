# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  set = Set.new(j.chars)
  count = 0
  s.each_char do |stone|
    count += 1 if set.include?(stone)
  end
  count
end

j = "aA"
s = "aAAbbbb"
p num_jewels_in_stones(j, s)
