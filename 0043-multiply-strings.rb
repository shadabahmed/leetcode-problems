
def multiply_digits(d1, d2, carry)
  sum = (d1.ord - 48) * (d2.ord - 48) + carry
  [sum % 10, sum / 10]
end

def multiply(num1, num2)
  multiplier = 1
  result = 0
  (num1.length - 1).downto(0) do |idx1|
    digit1 = num1[idx1]
    carry, current_sum, current_multiplier = 0, 0, 1
    (num2.length - 1).downto(0) do |idx2|
      digit2 = num2[idx2]
      sum, carry = multiply_digits(digit1, digit2, carry)
      current_sum += current_multiplier * sum
      current_multiplier *= 10
    end
    current_sum += carry * current_multiplier
    result += current_sum * multiplier
    multiplier *= 10
  end
  result.to_s
end
multiply '3', '6'
