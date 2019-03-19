def two_sum(nums, target)
  map = {}
  nums.each_with_index do |num, idx|
    diff = target - num
    if map.key?(diff)
      return [map[diff], idx]
    end
    map[num] = idx
  end
end
