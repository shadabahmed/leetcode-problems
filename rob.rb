def rob(nums, idx = 0)
  return 0 if idx >= nums.size
  next_sol = 0
  next_next_sol = 0
  (nums.length - 1).downto(0) do |idx|
    current_sol = [nums[idx] + next_next_sol, next_sol].max
    next_next_sol = next_sol
    next_sol = current_sol
  end
  next_sol
end

rob [1,2,3,1]
rob [100,2,3,110]
