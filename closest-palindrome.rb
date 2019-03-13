def num_digits(num)
  digits_count = 0
  while num > 0
    num /= 10
    digits_count += 1
  end
  digits_count
end

def invert_digits(num, digits_to_skip)
  inverted_num = 0
  while digits_to_skip > 0
    num /= 10
    digits_to_skip -= 1
  end
  while num > 0
    inverted_num = inverted_num * 10 + (num % 10)
    num /= 10
  end
  inverted_num
end

def left_digits(num, digits)
  divider = 1
  while digits > 0
    digits -= 1
    divider *= 10
  end
  (num / divider) * divider
end

def create_palindrome(num, digits)
  if digits % 2 == 1
    right_digits = (digits + 1) / 2
    left_digits(num, digits - right_digits) + invert_digits(num, right_digits)
  else
    left_digits(num, digits / 2) + invert_digits(num, digits / 2)
  end
end

def increment_digit(num, idx)
  multiplier = 10**idx
  (num / multiplier) * multiplier + multiplier
end

def decrement_digit(num, idx)
  multiplier = 10**idx
  (num / multiplier) * multiplier - multiplier
end

def nearest_palindromic(num)
  num = num.to_i
  digits = num_digits(num)
  palindrome = create_palindrome(num, digits)
  while palindrome == num
    palindrome = create_palindrome(num - 1, num_digits(num - 1))
  end
  other_num = if palindrome < num
                increment_digit(num, digits / 2)
              else
                decrement_digit(num, digits / 2)
              end
  other_palindrome = create_palindrome(other_num, num_digits(other_num))
  p [palindrome, other_num]
  if (palindrome - num).abs > (other_palindrome - num).abs
    other_palindrome.to_s
  elsif (palindrome - num).abs < (other_palindrome - num).abs
    palindrome.to_s
  else
    [palindrome, other_palindrome].min.to_s
  end
end
p nearest_palindromic('10')
