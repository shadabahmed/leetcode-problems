def number_of_arithmetic_slices(a, idx = 0, last_num = 0, last_diff = 0)
  return 0 if a.length < 3
  return 1 if idx >= a.length
  res = 0
  if idx == 0
    0.upto(a.length - 3) do |first_idx|
      (first_idx + 1).upto(a.length - 2) do |second_idx|
        diff = a[first_idx] - a[second_idx]
        (second_idx + 1).upto(a.length - 1) do |third_idx|
          if diff == a[second_idx] - a[third_idx]
            res += number_of_arithmetic_slices(a, third_idx + 1, a[third_idx], a[second_idx] - a[third_idx])
          end
        end
      end
    end
  else
    if last_num - a[idx] == last_diff
      res += number_of_arithmetic_slices(a, idx + 1, a[idx], last_diff)
    end
    res += number_of_arithmetic_slices(a, idx + 1, last_num, last_diff)
  end
  res
end


number_of_arithmetic_slices [2,4,6,8,10]


number_of_arithmetic_slices [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
