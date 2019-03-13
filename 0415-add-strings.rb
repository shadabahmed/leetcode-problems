# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  res, carry = '', 0
  larger, smaller = num1.length > num2.length ? [num1, num2] : [num2, num1]
  diff = larger.length - smaller.length
  (larger.length - 1).downto(0) do |idx|
    larger_digit = larger[idx]
    smaller_digit = idx >= diff ? smaller[idx - diff] : '0'    
    sum, carry = add_digits(larger_digit, smaller_digit, carry)
    res = sum + res
  end
  res = carry.to_s + res if carry > 0
  res
end

def add_digits(c1, c2, carry)
  x = c1.ord - 48 + c2.ord - 48 + carry
  [(48 + x % 10).chr , x / 10]
end

p add_strings '1', '276'
p add_strings '777', '276'