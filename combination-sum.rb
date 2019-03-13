def combination_sum(candidates, target, idx = 0, stack = [], res = [])
  return res if target.negative? || (target.zero? && stack.empty?)
  return res.push(stack.clone) if target.zero?
  0.upto(target/candidates[idx]) do |multiplier|
    multiplier.times { stack.push(candidates[idx]) }
    combination_sum(candidates, target - (multiplier * candidates[idx]), idx + 1, stack, res)
    multiplier.times { stack.pop }
  end
  res
end


def combination_sum(candidates, target, idx = 0, sum = 0, stack = [], res = [])
  return res if sum > target || idx >= candidates.length
  return res.push(stack.clone) if target == sum
  stack.push(candidates[idx])
  combination_sum(candidates, target, idx, sum + candidates[idx], stack, res)
  combination_sum(candidates, target, idx + 1, sum + candidates[idx], stack, res)
  stack.pop
  combination_sum(candidates, target, idx + 1, sum, stack, res)
  res
end

combination_sum [2,3,5], 8
