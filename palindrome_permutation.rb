def is_palindrome(s)
  i, j = 0, s.length - 1
  while i != j
    return false if s[i] != s[j]
    i += 1
    j -= 1
  end
  true
end

require 'set'
def can_permute_palindrome(s, idx = 0, res = [], charset = Set.new)
  return res.push(s.clone) if idx >= s.length
  return res if idx >= s.length/2 && s[idx] != s[s.length - 1 - idx]
  charset.add(s[idx])
  idx.upto(s.length - 1) do |swap_idx|
    next if swap_idx != idx && charset.include?(s[swap_idx])
    s[idx], s[swap_idx] = s[swap_idx], s[idx]
    can_permute_palindrome(s, idx + 1, res)
    s[idx], s[swap_idx] = s[swap_idx], s[idx]
  end
  res
end

can_permute_palindrome 'aab'
can_permute_palindrome 'carerac'

def can_permute_palindrome(s)
  map = {}
  s.each_char do |chr|
    if map[chr]
      map.delete(chr)
    else
      map[chr] = true
    end
  end
  if s.length % 2 == 0
    map.length.zero?
  else
    map.length == 1
  end
end

can_permute_palindrome 'aab'
can_permute_palindrome 'carerac'
