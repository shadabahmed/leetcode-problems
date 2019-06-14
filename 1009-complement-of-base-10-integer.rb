# @param {Integer} n
# @return {Integer}
def bitwise_complement(n)
  x, p = n, 1
  while x > 1
    p = (p << 1) + 1
    x /= 2
  end
  n ^ p
end

p bitwise_complement 5
p bitwise_complement 10
p bitwise_complement 1