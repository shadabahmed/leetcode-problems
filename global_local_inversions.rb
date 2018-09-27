

def is_ideal_permutation(a)
  idx = a.length - 2
  min_idx = a.length - 1
  while idx >= 0
    return false if a[idx] > a[min_idx]
    min_idx = idx + 1 if a[idx + 1] < a[min_idx]    
    idx -= 1
  end
  true
end

p is_ideal_permutation [1,2,3,4]
p is_ideal_permutation [1,3,2,4]
p is_ideal_permutation [5,4,3,2]
#
p is_ideal_permutation [1,2,0]
p is_ideal_permutation [2, 0, 1]
