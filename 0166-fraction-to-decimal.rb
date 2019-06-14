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

# @param {Integer} numerator
# @param {Integer} denominator
# @return {String}
def fraction_to_decimal(numerator, denominator)
  neg = numerator * denominator < 0
  res = neg ? '-' : ''
  numerator, denominator = numerator.abs, denominator.abs
  res << (numerator / denominator).to_s
  numerator = (numerator % denominator) * 10
  numerator.zero? ? res : "#{res}.#{get_decimal(numerator, denominator)}"
end

def get_decimal(numerator, denominator)  
  map, res = {}, ''
  while numerator > 0
    if map.key?(numerator)
      res.insert(map[numerator],'(') << ')'
      numerator = 0
    else
      map[numerator] = res.length
      res << (numerator / denominator).to_s
      numerator = (numerator % denominator) * 10
    end
  end
  res
end

p fraction_to_decimal 4, 333
p fraction_to_decimal 1, 90