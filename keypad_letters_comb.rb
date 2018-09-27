def get_letters(digit)
  num_of_letters = 3
  if digit == '7'
    start_digit = 'p'.ord
    num_of_letters = 4
  elsif digit == '9'
    start_digit = 'w'.ord
    num_of_letters = 4
  elsif digit == '8'
    start_digit = 't'.ord
  else
    start_digit = (digit.ord - '2'.ord) * 3 + 'a'.ord
  end
  start_digit.upto(start_digit + num_of_letters - 1).collect{|n| n.chr}
end

def letter_combinations(digits, idx = 0, stack = [], res = [])
  return stack.empty? ? res : res.push(stack.join) if idx >= digits.length
  get_letters(digits[idx]).each do |letter|
    stack.push(letter)
    letter_combinations(digits, idx + 1, stack, res)
    stack.pop
  end
  res
end
