def get_count(str, idx)
  num = 0
  while str[idx] != "["
    num = num * 10 + str[idx].ord - 48
    idx += 1
  end
  return [num, idx + 1]
end

def get_str(str, idx)
  res = ""
  while str[idx] != "]"
    res << str[idx]
    idx += 1
  end
  return [res, idx + 1]
end

def decode_string(s)
  idx, res = 0, ""
  while idx < s.length
    count, idx = get_count(s, idx)
    str, idx = get_str(s, idx)
    count.times do
      res << str
    end
  end
  res
end

def decode_string(s, first = 0, last = s.length - 1)
  if s[first].ord > 47 && s[first.ord] < 59
  end
end

def get_num(s, idx)
  num, multiplier = 0, 1
  while idx >= 0 && (48..57).include?(s[idx].ord)
    num += (s[idx].ord - 48) * multiplier
    multiplier *= 10
    idx -= 1
  end
  [num, idx + 1]
end

# @param {String} s
# @return {String}
def decode_string(s)
  stack = [""]
  idx = s.length - 1
  while idx >= 0
    if s[idx] == "]"
      stack.push("")
    elsif s[idx] == "["
      num, idx = get_num(s, idx - 1)
      stack.push(stack.pop * num + stack.pop)
    else
      stack.push(s[idx] + stack.pop)
    end
    idx -= 1
  end
  stack.pop
end

p decode_string "3[a]2[bc]"
"aaabcbc"
