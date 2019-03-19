def majority_element(nums)
  nums.sort[nums.length / 2]
end

def majority_element(nums)
  map = Hash.new(0)
  nums.each do |num|
    map[num] += 1
  end
  res = []
  map.each do |num, occurance|
    res << num if occurance > nums.length / 3
  end
  res
end

p majority_element [1,1,1,3,3,2,2,2]