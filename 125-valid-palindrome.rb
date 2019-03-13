# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  first, last = 0, s.length - 1
  while first < last
    first += 1 while first < last && !is_alpha?(s[first])
    last -= 1 while last > first && !is_alpha?(s[last])
    return false if first < last && !equal?(s[first], s[last])
    first += 1
    last -= 1
  end
  true
end

def is_alpha?(chr)
  (65..90).include?(chr.ord) || (97..122).include?(chr.ord) || (48..57).include?(chr.ord)
end

def equal?(a, b)
  a_ord, b_ord = a.ord, b.ord
  if a_ord <= 90 && b_ord > 90
    a_ord + 32 == b_ord
  elsif a_ord > 90 && b_ord <= 90
    a_ord == b_ord + 32
  else
    a_ord == b_ord
  end
end

p is_palindrome "A man, a plan, a canal: Panama"
p is_palindrome "race a ecar"
p is_palindrome "01"