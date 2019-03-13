
def is_letter(chr)
  ord = chr.ord
  (48..57).include?(ord) || (65..90).include?(ord) || (97..122).include?(ord)
end

def match(l1, l2)
  if l1.ord <= 57
    l1 == l2
  else
    l1.ord == l2.ord || l1.ord - 32 == l2.ord || l1.ord + 32 == l2.ord
  end
end

def is_palindrome(s)
  first, last = 0, s.length - 1
  while true
    while first < s.length && !is_letter(s[first])
      first += 1
    end
    while last > 0 && !is_letter(s[last])
      last -= 1
    end
    return true if first > last
    return false if !match(s[first], s[last])
    first += 1
    last -= 1
  end
end

p is_palindrome '0P'
#p is_palindrome "A man, a plan, a canal: Panama"
