# @param {Integer[]} a
# @return {Integer[]}
def pancake_sort(a)
  last_idx = a.length - 1
  res = []
  while last_idx > 0
    max_idx = find_highest_index(a, last_idx)
    if max_idx != last_idx
      if max_idx > 0
        res << max_idx + 1
        flip(a, max_idx)      
      end
      res << last_idx + 1
      flip(a, last_idx)
    end
    last_idx -= 1
  end
  res
end

def flip(a, last_idx)
  idx = 0
  while idx < last_idx
    a[idx], a[last_idx] = a[last_idx], a[idx]
    last_idx -= 1
    idx += 1
  end
end

def find_highest_index(a, last_idx)
  max_idx = 0
  1.upto(last_idx) do |idx|
    max_idx = idx if a[idx] >= a[max_idx]
  end
  max_idx
end

p pancake_sort [4,2,1,3]
p pancake_sort [1,2,3]
p pancake_sort [3,2,4,1]