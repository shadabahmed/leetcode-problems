# @param {String} expression
# @return {String}
def parse_ternary(expression)
  stack = [] 
  expression.each do |c|
    if c == ')'
      r_exp = ''
      r_exp = stack.pop + r_exp while !stack.last == '('
      stack.pop
      stack.push(evaluate_exp(r_exp))
    else
      stack.push(c)
    end
  end
  evaluate_exp(r_exp)
end

def evaluate_exp(exp)

end


# @param {String} expression
# @return {String}
def parse_ternary(expression)
  stack = []
  t, f = '', ''
  0.upto(expression.length) do |idx|
    if idx == expression.length
      f = stack.pop + f while stack.length > 2
      f = parse_ternary(f) if f[0] == 'T' || f[0] == 'F'
    elsif t.empty?
      c = expression[idx]
      if c == ':'
        t = stack.pop + t while stack.length > 2
        t = parse_ternary(t) if t[0] == 'T' || t[0] == 'F'
      else
        stack.push(c)
      end    
    end
  end
  expression[0] == 'T' ? t : f
end

#p parse_ternary "T?2:3"
p parse_ternary "F?1:T?4:5"
# p parse_ternary "T?T?F:5:3"


# @param {String} expression
# @return {String}
def parse_ternary(expression)
  res, _ = read_expr(expression)
  res
end

def read_expr(expr, idx = 0)
  if idx < expr.length - 2 && expr[idx + 1] == '?'
    start_idx = idx
    idx += 2
    t, idx = read_expr(expr, idx)
    f, idx = read_expr(expr, idx)
    expr[start_idx] == 'T' ? [t, idx] : [f, idx]
  elsif idx < expr.length
    res = ''
    while idx < expr.length && expr[idx] != ':'
      res = res + expr[idx] 
      idx += 1
    end
    [res, idx + 1]
  end
end

# @param {String} expression
# @return {String}
def parse_ternary(expression)
  idx = expression.length - 1
  stack = []
  while idx >= 0
    c = expression[idx]
    if c == '?'
      t, f = '', ''
      t << stack.pop while stack.last != ':'
      stack.pop
      f << stack.pop while stack.last != ':' && !stack.empty?
      stack.push(expression[idx - 1] == 'T' ? t : f)
      idx -= 1
    else
      stack.push(c)
    end
    idx -= 1
  end
  stack.last
end

p parse_ternary "F?1:2"
p parse_ternary "T?T?F:5:3"
p parse_ternary "F?1:T?4:5"