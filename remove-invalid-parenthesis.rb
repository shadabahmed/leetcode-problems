# @param {String} s
# @return {String[]}
require 'set'
def remove_invalid_parentheses(s)
  0.upto(s.length) do |nums_to_remove|
    res = remove_invalid_parens(s, 0, 0, nums_to_remove)
    return res if !res.empty?
  end
end

def remove_invalid_parens(s, idx, balance_factor, can_remove, stack = [], res = Set.new)
  return res.add(stack.join) if idx >= s.length && balance_factor == 0 && can_remove == 0
  return res if balance_factor < 0 || idx >= s.length
  if can_remove > 0 && s[idx] == '(' || s[idx] == ')'
    remove_invalid_parens(s, idx + 1, balance_factor, can_remove - 1, stack, res)
  end
  stack.push(s[idx])
  if s[idx] == '('
    balance_factor += 1
  elsif s[idx] == ')'
    balance_factor -= 1
  end
  remove_invalid_parens(s, idx + 1, balance_factor, can_remove, stack, res)
  stack.pop
  res
end
