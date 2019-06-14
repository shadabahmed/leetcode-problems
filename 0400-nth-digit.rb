# @param {Integer} n
# @return {Integer}
def find_nth_digit(n)
  s = 0  
  while n > 0
    s += 1
    num_digits = get_digits(s)
    if num_digits >= n
      return s.to_s[n - 1].to_i
    else
      n -= num_digits
    end
  end  
end

def get_digits(num)
  digits = 0
  while num > 0
    num /= 10
    digits += 1
  end
  digits
end

# p find_nth_digit 3
# p find_nth_digit 11


#1 * 9, 2 * 90, 3 * 900, 4 * 9000, 5 * 90000

def find_nth_digit(n)
  base = 9
  digits = 1
  numbers_with_digits = base * digits  
  while n > numbers_with_digits
    n -= numbers_with_digits
    digits += 1
    base *= 10
    numbers_with_digits = base * digits
  end
  (10 ** (digits -  1) + (n  - 1) / digits).to_s[(n - 1)% digits].to_i
end

p find_nth_digit 3
p find_nth_digit 10
p find_nth_digit 11
p find_nth_digit 100000000

