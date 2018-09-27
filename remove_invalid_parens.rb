require 'set'

def open_close_dels(s)
  open, close, to_del_close = 0, 0, 0
  s.chars.each do |c|
    if c == '('
      open += 1
    elsif c == ')'
      if open <= close
        to_del_close += 1
      else
        close += 1
      end
    end
  end
  [open - close, to_del_close]
end

def remove_parentheses(s, idx, to_del_open, to_del_close, bf = 0, stack = [], res = Set.new)
  return res.add(stack.join) if idx >= s.length && bf == 0
  return res if idx >= s.length || bf < 0
  if s[idx] == '(' && to_del_open > 0
    remove_parentheses(s, idx + 1, to_del_open - 1, to_del_close, bf, stack, res)
  elsif s[idx] == ')' && to_del_close > 0
    remove_parentheses(s, idx + 1, to_del_open, to_del_close - 1, bf, stack, res)
  end
  if s[idx] == '('
    bf += 1
  elsif s[idx] == ')'
    bf -= 1
  end
  stack.push(s[idx])
  remove_parentheses(s, idx + 1, to_del_open, to_del_close, bf, stack, res)
  stack.pop
  res
end

def remove_invalid_parentheses(s)
  to_del_open, to_del_close = open_close_dels(s)
  res = remove_parentheses(s, 0, to_del_open, to_del_close)
  if res.empty?
    ['']
  else
    res.to_a
  end
end

p remove_invalid_parenthses '(a)())()'
