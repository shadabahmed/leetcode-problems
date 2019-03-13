# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def largest_sum_after_k_negations(a, k)
  a.sort!
  min_idx = 0
  a.each_with_index do |num, idx|
    if k > 0 && num < 0
      a[idx] *= -1
      k -= 1
    end
    min_idx = idx if num < a[min_idx]
  end
  if k % 2 == 1
    a[min_idx] *= -1
  end
  a.sum
end
p largest_sum_after_k_negations [2,-3,-1,5,-4], 2
p largest_sum_after_k_negations [4,-5,4,-5,9,4,5], 1
p largest_sum_after_k_negations [-8,3,-5,-3,-5,-2], 6
p largest_sum_after_k_negations [4,2,3], 1
p largest_sum_after_k_negations [3,-1,0,2], 3
