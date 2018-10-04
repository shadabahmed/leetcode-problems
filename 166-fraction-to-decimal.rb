# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  return '0' if numerator.zero?
  remainder_map = {}
  res = ''
  if (numerator < 0) ^ (denominator < 0)
    res << '-'
  end
  numerator, denominator = numerator.abs, denominator.abs
  res << (numerator / denominator).to_s
  remainder = numerator % denominator
  return res if remainder.zero?
  res << '.'
  while !remainder.zero?
    if remainder_map[remainder]
      res.insert(remainder_map[remainder],'(')
      res << ')'
      return res
    end
    remainder_map[remainder] = res.length
    remainder *= 10
    res << (remainder/denominator).to_s
    remainder %= denominator
  end
  res  
end

p fraction_to_decimal 4, 333
p fraction_to_decimal 1, 90