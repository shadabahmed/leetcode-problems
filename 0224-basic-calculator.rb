# @param {String} s
# @return {Integer}
def calculate(s)
  stack = []
  s.each_char do |c|
    if c == ')'
      expr = ''
      expr = stack.pop + expr while !stack.empty? && stack.last != '('
      stack.pop
      res = calculate_expr(expr)
      if res < 0 && !stack.empty?
        if stack.last == '+'
          stack.pop
          stack.push('-')
        elsif stack.last == '-'
          stack.pop
          stack.push('+')
        end
        res *= -1
      end
      stack.push(res.to_s)
    elsif c != ' '
      stack.push(c)
    end
  end
  calculate_expr(stack.join)
end

def calculate_expr(s)
  prev = 0
  prev_op = '+'
  idx = 0
  while idx < s.length    
    if (48..57).include?(s[idx].ord)
      last_idx = idx
      last_idx += 1 while last_idx < s.length - 1 && (48..57).include?(s[last_idx + 1].ord)
      num = s[idx..last_idx].to_i
      if prev_op == '+'
        prev += num
      elsif
        prev -= num
      end      
      idx = last_idx
    elsif s[idx] == '+' || s[idx] == '-'
      prev_op = s[idx]   
    end    
    idx += 1
  end    
  prev
end

# p calculate "(1+(4+5+2)-3)+(6+8)"
# p calculate '2 - 1 + 2'
# p calculate '2 - (11 - 30)'
p calculate "(5-(1+(5)))"