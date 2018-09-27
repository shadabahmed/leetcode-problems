def generate(num_rows)
  return [] if num_rows.zero?
  res = [[1]]
  (num_rows - 1).times do
    prev_arr = res[-1].clone
    prev_arr << 0
    prev = 0
    0.upto(prev_arr.length - 1) do |idx|
      tmp = prev_arr[idx]
      prev_arr[idx] = prev + prev_arr[idx]
      prev = tmp
    end
    res.push(prev_arr)
  end
  res
end
