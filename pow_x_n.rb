# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  if n < 0
    x = 1.0 / x
    n *= -1
  end
  res = 1
  while n > 0
    res *= x if n % 2 == 1
    x *= x if n > 1
    n = n / 2
  end
  res
end

p my_pow(2, 10)
p my_pow(3, 6)
p my_pow(3, 0)
