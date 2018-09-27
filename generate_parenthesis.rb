def generate_parenthesis(n, stack = [], balance_count = 0, res = [])
  return res.push(stack.join) if n == 0 && balance_count == 0
  return res if balance_count < 0 || n == 0
  stack.push('(')
  generate_parenthesis(n - 0.5, stack, balance_count + 1, res)
  stack.pop
  stack.push(')')
  generate_parenthesis(n - 0.5, stack, balance_count - 1, res)
  stack.pop
  res
end


def generate_parenthesis(n, stack = [], res = [], left = 0, right = 0)
  return res.push(stack.join) if stack.length == 2 * n
  if left < n
    stack.push('(')
    generate_parenthesis(n, stack, res, left + 1, right)
    stack.pop
  end
  if right < left
    stack.push(')')
    generate_parenthesis(n, stack, res, left, right + 1)
    stack.pop
  end
  res
end


generate_parenthesis 3
