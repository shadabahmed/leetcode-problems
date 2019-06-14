# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
  (t.sum - s.sum).chr
end

p find_the_difference 'abc', 'abcd'