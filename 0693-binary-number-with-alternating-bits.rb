# @param {Integer} n
# @return {Boolean}
def has_alternating_bits(n)
  max = 1
  max *= 2 while max * 2 <= n
  num, multiplier = 0, 1
  while max > 0
    num += max * multiplier
    multiplier = multiplier.zero? ? 1 : 0
    max /= 2
  end
  num == n
end

# @param {Integer} n
# @return {Boolean}
def has_alternating_bits(n)
  max = 1
  max *= 2 while max * 2 <= n
  num, multiplier = 0, 1
  while max > 0
    num += max * multiplier
    multiplier = multiplier.zero? ? 1 : 0
    max /= 2
  end
  num == n
end

p has_alternating_bits 10