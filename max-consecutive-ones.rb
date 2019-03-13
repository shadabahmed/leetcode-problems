def find_max_consecutive_ones(nums)
  count, max_count = 0, 0
  nums.each do |num|
    if num == 1
      count += 1
      max_count = count if count > max_count
    else
      count = 0
    end
  end
  max_count
end
