# @param {String} s
# @return {Integer}
def calculate(s)
  stack, idx, current = [], 0, ''
  while idx < s.length    
    if s[idx] == ')'
      current = stack.pop + solve(current).to_s
    elsif s[idx] == '('
      stack.push(current)
      current = ''
    else
      current << s[idx]
    end    
    idx += 1
  end
  solve(current)
end

def solve(s)
  first_num, idx = get_num(s)
  stack = [first_num]
  while idx < s.length
    op, idx = get_op(s, idx) 
    next_num, idx = get_num(s, idx)
    if op == '/' || op == '*'
      stack.push(operate(stack.pop, next_num, op))
    else
      stack.push(op)
      stack.push(next_num)
    end
  end
  res = stack.first
  idx = 1
  while idx < stack.length 
    op, next_num = stack[idx], stack[idx + 1]
    res = operate(res, next_num, op)
    idx += 2
  end
  res
end

def get_num(s, idx = 0)
  idx += 1 while idx < s.length && s[idx] == ' '
  res = s[idx] == '-' ? '-' : ''
  idx = s[idx] == '-' ? idx + 1 : idx
  while idx < s.length && ((48..57).include?(s[idx].ord))
    res << s[idx]
    idx += 1
  end
  idx += 1 while idx < s.length && s[idx] == ' '
  [res.to_i, idx]
end

def get_op(s, idx)
  idx += 1 while idx < s.length && s[idx] == ' '
  op = s[idx]
  idx += 1
  idx += 1 while idx < s.length && s[idx] == ' '
  [op, idx]
end

def operate(num1, num2, op)
  if op == '+'
    num1 + num2
  elsif op == '-'
    num1 - num2
  elsif op == '*'
    num1 * num2
  elsif op == '/'
    num1 / num2
  end
end
