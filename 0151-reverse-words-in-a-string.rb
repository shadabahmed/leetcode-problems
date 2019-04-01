
def rev_string(str, left, right)
  while left < right
    str[left], str[right] = str[right], str[left]
    left += 1
    right -= 1
  end
end

def reverse_words(str)
  return str if str.length.zero?
  rev_str, start, finish = [], 0, str.length - 1
  start += 1 while start < str.length && str[start] == ' '
  finish -= 1 while finish > 0 && str[finish] == ' '
  (finish).downto(start) do |idx|
    next if str[idx] == ' ' && (idx == 0 || str[idx - 1] == ' ')
    rev_str.push(str[idx])
  end
  start = 0
  0.upto(finish) do |last|
    next if last != finish && rev_str[last] != ' '
    rev_string(rev_str, start, finish - 1)
    start = finish + 1
  end
  rev_str.join
end

reverse_words ' shadab     ahmed '


# @param {String} s
# @return {String}
def reverse_words(s)
  words = []
  idx = s.length - 1
  while idx >= 0
    idx -= 1 while idx >= 0 && s[idx] == ' '
    break if idx < 0
    end_idx = idx
    idx -= 1 while idx >= 0 && s[idx] != ' '
    start_idx = idx + 1
    words << s[start_idx..end_idx]
  end 
  words.join(' ')  
end

def reverse_words(s)
  s.split(' ').compact.reverse.join(' ')
end

p reverse_words "the sky is blue"
p reverse_words "  hello world!  "
