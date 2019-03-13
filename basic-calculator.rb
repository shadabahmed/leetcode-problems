# def get_num(s, first, last)
#   num, multiplier = 0, 1
#   while last >= first
#     num += multiplier * (s[last].ord - 48)
#     last -= 1
#     multiplier *= 10
#   end
#   num
# end
#
# MAP = {'/' => 4, '*' => 3, '+' => 2, '-' => 1}
#
# def operate(num1, num2, op)
#   if op == '/'
#     if num1 < 0
#       -1 * (num1.abs / num2)
#     elsif num2 < 0
#       -1 * (num1 / num2.abs)
#     else
#       num1 / num2
#     end
#   elsif op == '*'
#     num1 * num2
#   elsif op == '+'
#     num1 + num2
#   else
#     num1 - num2
#   end
# end
#
# def greater_op(op1, op2)
#   MAP[op1] > MAP[op2]
# end
#
# def calculate(s, idx = 0, prev_result = 0, prev_op = '+')
#   return prev_result if idx >= s.length
#   idx += 1 while idx < s.length && s[idx] == ' '
#   start = idx
#   idx += 1 while idx < s.length && s[idx].ord > 47 && s[idx].ord < 58
#   cur_num = get_num(s, start, idx - 1)
#   idx += 1 while idx < s.length && s[idx] == ' '
#   cur_op = idx < s.length ? s[idx] : '+'
#   if greater_op(cur_op, prev_op)
#     operate(prev_result, calculate(s, idx + 1, cur_num, cur_op), prev_op)
#   else
#     calculate(s, idx + 1, operate(prev_result, cur_num, prev_op), cur_op)
#   end
# end
#
# # def calculate(s)
# #   idx, stack = 0, []
# #   while idx < s.length
# #     idx += 1 while idx < s.length && s[idx] == ' '
# #     num = 0
# #     while idx < s.length && s[idx].ord > 47 && s[idx].ord < 58
# #       num = num * 10 + s[idx].ord - 48
# #       idx += 1
# #     end
# #     stack.push(num)
# #     idx += 1 while idx < s.length && s[idx] == ' '
# #     stack.push(s[idx]) if idx < s.length
# #     idx += 1
# #   end
# #   stack
# # end
#
#
# p calculate ' 3 / 2'
#
#
#
#
#
#
#
#
#
#
#

# def calculate(expr)
#   retrun 0 if expr.empty?
#   expr = get_expr_stack(expr)
#   while expr.length > 1
#     current_num, current_op, next_num = expr.shift, expr.shift, expr.shift
#     next_op = expr.first
#     if next_op && greater_op(next_op, current_op)
#       if current_op == '-'
#         next_num = -1 * next_num
#         current_op = '+'
#       end
#       expr.unshift(next_num)
#       expr.push(current_op)
#       expr.push(current_num)
#     else
#       expr.unshift(operate(current_num, next_num, current_op))
#     end
#     p expr
#   end
#   expr.first
# end














MAP = {'/' => 4, '*' => 3, '+' => 2, '-' => 1}

def greater_op(op1, op2)
  MAP[op1] > MAP[op2]
end

def operate(num1, num2, op)
  if op == '/'
    if num1 < 0
      -1 * (num1.abs / num2)
    elsif num2 < 0
      -1 * (num1 / num2.abs)
    else
      num1 / num2
    end
  elsif op == '*'
    num1 * num2
  elsif op == '+'
    num1 + num2
  else
    num1 - num2
  end
end

def get_num(s, idx)
  idx += 1 while idx < s.length && s[idx] == ' '
  first = idx
  idx += 1 while idx < s.length && s[idx].ord > 47 && s[idx].ord < 58
  last = idx
  idx += 1 while idx < s.length && s[idx] == ' '
  num = 0
  while first < last
    num *= 10
    num += (s[first].ord - 48) % 10
    first += 1
  end
  [num, idx]
end

def get_op(s, idx)
  idx += 1 while idx < s.length && s[idx] == ' '
  op = idx < s.length ? s[idx] : '+'
  idx += 1
  idx += 1 while idx < s.length && s[idx] == ' '
  [op, idx]
end

def get_expr_stack(expr)
  idx, stack = 0, []
  while idx < expr.length
    num, idx = get_num(expr, idx)
    stack.push(num)
    if idx < expr.length
      op, idx = get_op(expr, idx)
      stack.push(op)
    end
  end
  stack
end

def calculate(expr)
  expr = get_expr_stack(expr)
  op_idx = 1
  result = 0
  while op_idx < expr.length - 1
    op = expr[op_idx]
    left = expr[op_idx - 1]
    right = expr[op_idx + 1]
    if op == '/'
      expr[op_idx - 1] = 1
      expr[op_idx] = '*'
      expr[op_idx + 1] = operate(left, right, op)
    elsif op == '*'
      expr[op_idx - 1] = 0
      expr[op_idx] = '+'
      expr[op_idx + 1] = operate(left, right, op)
    elsif expr[op_idx] == '-'
      expr[op_idx] = '+'
      expr[op_idx + 1] = -1 * expr[op_idx + 1]
    else
      op_idx += 2
    end
  end
  0.step(expr.length - 1, 2) do |idx|
    result += expr[idx]
  end
  result
end

p calculate "1+2*5/3+6/4*2"
p calculate ' 14 - 3 / 2'

p calculate ' 2 - 3 + 4'
# def calculate(s)
#   idx, stack = 0, []
#   while idx < s.length
#     idx += 1 while idx < s.length && s[idx] == ' '
#     num = 0
#     while idx < s.length && s[idx].ord > 47 && s[idx].ord < 58
#       num = num * 10 + s[idx].ord - 48
#       idx += 1
#     end
#     stack.push(num)
#     idx += 1 while idx < s.length && s[idx] == ' '
#     stack.push(s[idx]) if idx < s.length
#     idx += 1
#   end
#   stack
# end


p calculate ' 3/2 '
