# @param {String} s
# @return {Integer}
def num_decodings(s, idx = 0)
  return 0 if s.length.zero? || s[0] == '0'
  prev, prev_prev = 1, 1
  1.upto(s.length - 1) do |idx|
    digit = s[idx]
    with_prev = s.slice(idx - 1, 2)
    current = 0
    if (49..57).include?(digit.ord)
      current += prev
    end
    if (10..26).include?(with_prev.to_i)
      current += prev_prev
    end
    prev_prev = prev
    prev = current
  end
  prev
end

p num_decodings('01')