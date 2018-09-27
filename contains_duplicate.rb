def contains_duplicate(nums)
  cache = {}
  nums.each do |num|
    return true if cache.key?(num)
    cache[num] = true
  end
  false
end
