# https://leetcode.com/problems/reverse-integer/
# @param {Integer} x
# @return {Integer}
MAX = 2**31 - 1
NEG_MAX = 2**31
def reverse(x)
  neg = x < 0 ? -1 : 1
  x *= neg  
  num = 0
  while x > 0
    num = num * 10 + x % 10
    x /= 10
  end
  return 0 if neg ? num > MAX : num > NEG_MAX
  num * neg
end
    