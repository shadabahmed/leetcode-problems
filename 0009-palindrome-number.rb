# https://leetcode.com/problems/palindrome-number/

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative?
  last, first = 1, 1
  last *= 10 while x / last >= 10
  while last >= first
    return false unless (x / last) % 10 == (x / first) % 10
    last /= 10
    first *= 10
  end
  true
end

p is_palindrome 10
# p is_palindrome 1
# p is_palindrome 121
# p is_palindrome 123
# p is_palindrome 1229221
# p is_palindrome 12298221