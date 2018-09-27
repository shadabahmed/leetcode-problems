def four_sum(nums, target)
  res, map = [], {}
  nums.sort!
  nums.each_with_index do |num, index|
    (index + 1).upto(nums.length - 1) do |other_idx|
      other_num = nums[other_idx]
      sum = num + other_num
      map[sum] ||= {}
      map[sum][num] = other_num
      if map[target - sum]
        res += map[target - sum].collect{|k,v| [k,v,num,other_num]}
      end
    end
  end
  res
end
four_sum [1, 0, -1, 0, -2, 2], 0
