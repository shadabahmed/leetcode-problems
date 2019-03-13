# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity(a)
  even, odd = 0, 0
  while odd < a.length
    if a[odd].even?
      a[odd], a[even] = a[even], a[odd]
      even += 1
    end
    odd += 1
  end
  a    
end

p sort_array_by_parity [3,1,2,4]