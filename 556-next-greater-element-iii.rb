# @param {Integer} a
# @return {Integer}

# idea - starting from last digit, find the first lesser element to the left
# e.g. 230, for 0 no elements
# for 3, next element is 2
def next_greater_element(a)
  stack = []
  next_greater = a
  num_digits = len_digits(a)
  num_digits.downto(2) do |digit|
    stack.push(digit)
  end
  1.upto(num_digits - 1) do |digit|
    val = get_digit(a, digit)
    stack.pop while !stack.empty? && get_digit(a, stack.last) >= val
    if !stack.empty?
      swap_digits(next_greater, stack.top, digit)
      return next_greater
    end
  end
  -1
end

def get_digit(a, digit)
  (a/10 ** (digit - 1)) % 10
end

def swap_digits(a, d1, d2)
  digit_value1 = get_digit(a, d1)  
  set_digit(a, d1, get_digit(a, d2))
  set_digit(a, d2, digit_value1)
end

def set_digit(a, digit, value)
  a + (value - get_digit(a, digit)) * 10**(digit - 1)
end

def len_digits(a)
  multiplier, digits = 1, 0
  while a / multiplier != 0
    multiplier *= 10
    digits += 1
  end
  digits
end

def next_greater_element(n)
  a = n.to_s.chars.to_a
  decreasing_idx = a.length - 2
  
  while decreasing_idx >= 0 && a[decreasing_idx] >= a[decreasing_idx + 1]
    decreasing_idx -= 1
  end  
  return -1 if decreasing_idx < 0
  swap_idx = a.length - 1
  while swap_idx > decreasing_idx && a[swap_idx] <= a[decreasing_idx]
    swap_idx -= 1
  end
  a[swap_idx], a[decreasing_idx] = a[decreasing_idx], a[swap_idx]
  reverse(a, decreasing_idx + 1)
  return_val = a.join.to_i
  return_val >= 2**31 ? -1 : return_val
end

def reverse(arr, first, last = arr.length - 1)
  while first < last
    arr[first], arr[last] = arr[last],arr[first]
    first += 1
    last -= 1
  end
end

p next_greater_element(230241)
p next_greater_element(12345)
p next_greater_element(2147483647)

p next_greater_element 12222333