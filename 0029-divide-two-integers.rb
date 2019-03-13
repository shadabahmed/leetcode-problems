# https://leetcode.com/problems/divide-two-integers/

MIN = -2**31
MAX = 2**31 - 1

# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  if dividend < 0 && divisor > 0 || dividend > 0 && divisor < 0
    [('-' + divide_helper(dividend.abs, divisor.abs).to_s).to_i, MIN].max
  else
    [divide_helper(dividend.abs, divisor.abs), MAX].min
  end
end

def divide_helper(dividend, divisor, parent = 0)
  if dividend < divisor
    0
  else    
    current_divisor = divisor
    bits = 0
    while dividend >= current_divisor << 1
      current_divisor <<= 1
      bits += 1
    end
    (1 << bits) + divide_helper(dividend - current_divisor, divisor)
  end
end

p divide_helper 16, 2
p divide 12, 3
p divide 7, -3
p divide 1, 1
p divide_helper 2147483648, 1
p divide_helper 65, 5