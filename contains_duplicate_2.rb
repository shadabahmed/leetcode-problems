require 'set'

def contains_nearby_duplicate(nums, k)
  set = Set.new
  nums.each_with_index do |num, index|
    return true if set.include?(num)
    set.add(num)
    set.delete(nums[index - k]) if set.size > k
  end
  false
end

contains_nearby_duplicate [1,2,3,1,2,3], 2
contains_nearby_duplicate [1,0,1,1], 1
