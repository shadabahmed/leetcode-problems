# Example 1:
#
# Input: num = "123", target = 6
# Output: ["1+2+3", "1*2*3"]
# Example 2:
#
# Input: num = "232", target = 8
# Output: ["2*3+2", "2+3*2"]
# Example 3:
#
# Input: num = "105", target = 5
# Output: ["1*0+5","10-5"]
# Example 4:
#
# Input: num = "00", target = 0
# Output: ["0+0", "0-0", "0*0"]
# Example 5:
#
# Input: num = "3456237490", target = 9191
# Output: []
# add_operators '123', 6
# add_operators '232', 25
# add_operators '105', 5
# add_operators '00', 0
#


def op(num1, num2, operand)
  if operand == '+'
    num1 + num2
  elsif operand == '-'
    num1 - num2
  elsif operand == '*'
    num1 * num2
  end
end

def add_operators(num, target, calculated = 0, idx = 0, res = [], stack = [])
  last_operand = stack.last || '+'
  idx.upto(num.length - 1) do |end_idx|
    break if end_idx > idx && num[idx] == '0'
    substr = num[idx..end_idx]
    stack.push(substr)
    current_num = substr.to_i

    if end_idx == num.length - 1
      res.push(stack.join) if op(calculated, current_num, last_operand) == target
    else
      %w[* + -].each do |operand|
        stack.push(operand)
        if last_operand == '*'
          add_operators(num, target, calculated * current_num, end_idx + 1, res, stack)
        elsif last_operand == '+'
          add_operators(num, target - calculated, current_num, end_idx + 1, res, stack)
        else
          add_operators(num, target - calculated, -1 * current_num, end_idx + 1, res, stack)
        end
        stack.pop
      end
    end
    stack.pop
  end
  res
end

add_operators '123456789', 45
