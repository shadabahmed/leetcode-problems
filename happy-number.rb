require 'set'

def is_happy(n)
  sum_squares = n
  set = Set.new([n])
  while sum_squares != 1
    num = sum_squares
    sum_squares = 0
    while num > 0
      sum_squares += (num % 10) * (num % 10)
      num /= 10
    end
    return false if set.include?(sum_squares)
    set.add(sum_squares)
  end
  true
end

is_happy 2
