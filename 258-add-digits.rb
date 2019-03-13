# @param {Integer} num
# @return {Integer}
def add_digits(num)
  while num >= 10
    num = sum_digits(num)
  end
  num
end

def sum_digits(num)
  sum = 0
  while num > 0
    sum += num % 10
    num /= 10
  end
  sum
end

p add_digits 11