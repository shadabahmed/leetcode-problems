# @param {Integer} num
# @return {String}
def convert_to_base7(num)
  return '0' if num.zero?
  res = '' 
  neg = num < 0
  num = num.abs
  while num > 0
    res = (num % 7).to_s + res
    num /= 7
  end    
  neg ? '-' + res : res
end

p convert_to_base7 -7
p convert_to_base7 0