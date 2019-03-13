# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k, perm = [])
  permutation(1.upto(n).collect(&:to_s), 0, k)
end

class Integer
  def fact
    (2..self).reduce(1,:*)
  end
end

def permutation(arr, idx, k)
  while k > 1 && idx < arr.length    
    sub_permutations = (arr.size - idx - 1).fact
    if k > sub_permutations
      swap_idx = (k - 1) / sub_permutations + idx
      k -= sub_permutations * ((k - 1) / sub_permutations)
      swap_val = arr[swap_idx]
      swap_idx.downto(idx + 1) do |idx|
        arr[idx] = arr[idx - 1]
      end
      # Put the swap value in the idx position
      arr[idx] = swap_val
    end
    idx += 1
  end
  arr.join 
end

# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k, perm = [])
  permutation(1.upto(n).collect(&:to_s), 0, k)
end

class Integer
  def fact
    (2..self).reduce(1,:*)
  end
end

def permutation(arr, idx, k)
  return arr.join if k <= 1
  swap_idx, sub_permutations = idx, (arr.size - idx - 1).fact
  while k >= sub_permutations
    k -= sub_permutations
    swap_idx += 1
  end
  swap_val = arr[swap_idx]
  swap_idx.downto(idx + 1) do |idx|
    arr[idx] = arr[idx - 1]
  end
  arr[idx] = swap_val
  permutation(arr, idx + 1, k)
end


p get_permutation 3, 1
p get_permutation 3, 2
p get_permutation 3, 3
p get_permutation 3, 4
p get_permutation 3, 5
p get_permutation 3, 6
