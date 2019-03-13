# https://leetcode.com/problems/string-to-integer-atoi/

RANGE = (48..57)
MAX = 2**31 - 1
MIN = -2**31
def my_atoi(str)
  idx, negative, num = 0, false, 0
  while idx < str.length && str[idx] == ' '
    idx += 1
  end
  if str[idx] == '-' || str[idx] == '+'
    negative = str[idx] == '-'
    idx += 1
  end
  return 0 if idx >= str.length || !RANGE.include?(str[idx].ord)
  start_idx = idx
  while idx < str.length && RANGE.include?(str[idx].ord)
    idx += 1
  end
  base = negative ? -1 : 1
  (idx - 1).downto(start_idx) do |digit_idx|
    num += (str[digit_idx].ord  - 48) * base
    return MIN if num < MIN
    return MAX if num > MAX
    base *= 10
  end
  num
end
