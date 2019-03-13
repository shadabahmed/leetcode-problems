LOWER_RANGE = 'a'.ord..'z'.ord
UPPER_RANGE = 'A'.ord..'Z'.ord
NUM_RANGE = '0'.ord..'9'.ord
# @param {String} s
# @return {String}
def reverse_only_letters(s)
  left, right = 0, s.length - 1
  while left < right
    while left < right && !is_alpha(s[left])
      left += 1
    end
    while left < right && !is_alpha(s[right])
      right -= 1
    end
    s[left], s[right] = s[right], s[left]
    left += 1
    right -= 1
  end
  s
end

def is_alpha(chr)
  LOWER_RANGE.include?(chr.ord) || UPPER_RANGE.include?(chr.ord)
end
p reverse_only_letters "a-bC-dEf-ghIj"
p reverse_only_letters "7_28]"
p reverse_only_letters "Test1ng-Leet=code-Q!"