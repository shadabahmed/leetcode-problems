def can_jump(nums)
  arr = [false] * nums.length
  arr[0] = true
  0.upto(nums.length - 1) do |idx|
    next unless arr[idx]
    (idx + nums[idx]).downto(idx + 1) do |jump_idx|
      break if arr[jump_idx]
      arr[jump_idx] = true
    end
  end
  arr[nums.length - 1]
end

def can_jump(nums)
  max_idx = 0
  0.upto(nums.length - 1) do |idx|
    return false if idx > max_idx
    max_idx = [max_idx, idx + nums[idx]].max
  end
  true
end
can_jump [1,3,0,0,4]
