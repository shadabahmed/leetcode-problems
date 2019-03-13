# @param {String} s
# @return {Integer[]}
def di_string_match(s)
  min, max = 0, s.length
  s.each_char.collect do |letter|
    letter == 'I' ? (min += 1) - 1 : (max -= 1) + 1
  end.push(max)
end