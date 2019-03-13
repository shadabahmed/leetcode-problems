def num_ways(n, k)
  return 0 if n == 0 || k == 0
  last, second_last = k, 0
  (n - 1).times do
    current = (k - 1) * (second_last + last)
    second_last = last
    last = current
  end
  last + second_last
end

num_ways 3, 2
num_ways 4, 2
