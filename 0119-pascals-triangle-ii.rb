def get_row(row_index)
  res = []
  0.upto(row_index) do |row|
    prev = row == 0 ? 1 : 0
    res << 0
    0.upto(res.length - 1) do |idx|
      tmp = res[idx]
      res[idx] += prev
      prev = tmp
    end
  end
  res
end
