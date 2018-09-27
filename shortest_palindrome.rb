# @param {String} s
# @return {String}

def is_palindrome?(s, last)
  start = 0
  while start < last
    return false if s[start] != s[last]
    start += 1
    last -= 1
  end
  true
end

def longest_palindrome_length(s)
  max = 0
  max += 1 while s[max] == s[0]
  (s.size - 1).downto(0) do |last|
    return (last + 1) if is_palindrome?(s, last) && last > max
  end
  0
end

def shortest_palindrome(s)
  return s if s.length <= 1
  idx = longest_palindrome_length(s)
  loop do
    break if idx >= s.length
    s = s[idx] + s
    idx += 2
  end
  s
end

#p shortest_palindrome("abc")

def match_string(s, start_idx, end_idx, gap)
  return false if end_idx >= s.length
  while end_idx - start_idx > gap && s[start_idx] == s[end_idx]
    end_idx -= 1
    start_idx += 1
  end
  end_idx - start_idx <= gap
end

def longest_palindrome_length(s, start_idx = 0)
  return 0 if start_idx >= s.length
  idx = start_idx
  idx += 1 while s[start_idx] == s[idx]
  max_len = idx - start_idx
  next_palindrome_length = longest_palindrome_length(s, idx)
  if next_palindrome_length > 1 && match_string(s, start_idx, idx + max_len + next_palindrome_length - 1, next_palindrome_length)
    2 * max_len + next_palindrome_length
  else
    max = s.length - start_idx - 2 * max_len
    max.downto(1) do |next_palindrome_length|
      if match_string(s, start_idx, idx + max_len + next_palindrome_length - 1, next_palindrome_length)
        return 2 * max_len + next_palindrome_length
      end
    end
    max_len
  end
end

def shortest_palindrome(s)
  return s if s.length <= 1
  idx = longest_palindrome_length(s)
  loop do
    break if idx >= s.length
    s = s[idx] + s
    idx += 2
  end
  s
end

# p shortest_palindrome("aacecaaa")
# "ababbabbbababbbabbaba"
# "ababbabbbababbbabbaba"
# "ababbabbbabababbbabbaba"
# p longest_palindrome_length "ababbbabbaba"
# p shortest_palindrome "ababbbabbaba"
#p longest_palindrome_length "aacecaaa"
"efbababababababababfe"
"efbabababababfe"
"efbabababababfe"
p longest_palindrome_length "abababababfe"
p shortest_palindrome "abababababfe"
