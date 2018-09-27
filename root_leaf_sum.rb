def sum_numbers(root, stack = [])
  return 0 if root.nil?
  stack.push(root.val)
  res = if root.left || root.right
          sum_numbers(root.left, stack) + sum_numbers(root.right, stack)
        else
          stack.join.to_i
        end
  stack.pop
  res
end
