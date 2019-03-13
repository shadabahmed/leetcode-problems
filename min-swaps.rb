def min_swap(a, b)
  swaps = 0
  1.upto(a.length - 1) do |idx|
    if a[idx] <= a[idx - 1] || b[idx] <= b[idx - 1]
      a[idx], b[idx] = b[idx], a[idx]
      swaps += 1
    end
  end
  swaps
end
min_swap [0,3,5,8,9], [2,1,4,6,9]

min_swap [0,4,4,5,9], [0,1,6,8,10]
