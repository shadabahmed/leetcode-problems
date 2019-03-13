# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity_ii(a)
  even, odd = 0, 1
  while odd < a.length && even < a.length
    even += 2 while even < a.length && a[even].even?
    odd += 2 while odd < a.length && a[odd].odd?
    break if even >= a.length || odd >= a.length
    if a[even].odd?
      a[even], a[odd] = a[odd], a[even]
      odd += 2
    elsif a[odd].even?
      a[even], a[odd] = a[odd], a[even]
      even += 2
    end
  end
  a
end

p sort_array_by_parity_ii [4,2,5,7]