def reverse(stack)
  return stack if stack.empty?
  current = stack.pop
  reverse(stack)
  insert_at_bottom(stack, current)
end

def insert_at_bottom(stack, num)
  return stack.push(num) if stack.empty?
  current = stack.pop
  insert_at_bottom(stack, num)
  stack.push(current)
end

reverse([1,2,3])
# [1,2,3] -> [3,2,1]
