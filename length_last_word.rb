# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  idx = s.length - 1
  idx -= 1 while s[idx] == ' '
  word_end = idx
  (idx).downto(-1) do |idx|
    return (word_end - idx) if (idx == -1 || s[idx] == ' ')
  end
  0
end

p length_of_last_word 'a '
p length_of_last_word 'a book'
p length_of_last_word "Hello World"