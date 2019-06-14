MAP = {'+' => '-', '-' => '*' , '*' => '/'}
def calculate(s, op = '+')
  parts = s.split(op)
  if MAP.key?(op)
    parts.each_with_index do |part, idx|
      parts[idx] = calculate(part, MAP[op])
    end
  end
  res = parts[0].to_i
  1.upto(parts.length - 1) do |idx|
    res = operate(res, parts[idx].to_i, op)
  end  
  res
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

def calculate(s)
  solve(s, %w[+ -], %w[/ *])
end

def solve(s, current_layer, next_layer = [])
  idx = 0
  idx += 1 while idx < s.length && !current_layer.include?(s[idx])
  num_str = s[0..(idx - 1)]
  res = next_layer.empty? ? num_str.to_i : solve(num_str, next_layer)
  return res if idx == s.length
  op = s[idx]
  idx, prev_idx = idx + 1, idx + 1
  while idx <= s.length    
    if idx == s.length || current_layer.include?(s[idx])
      num_str = s[prev_idx..(idx - 1)]
      num = next_layer.empty? ? num_str.to_i : solve(num_str, next_layer)
      res = operate(res, num, op)
      break if idx == s.length
      next_op = s[idx]
      op = next_op
      prev_idx = idx + 1
    end
    idx += 1
  end
  res
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

p calculate '2*5/2'
