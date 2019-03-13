# @param {Integer[]} nums
# @return {Boolean}
def judge_point24(nums, idx = 0, stack = [])
  if idx == 3
    return is_24?(stack)
  else
    stack.push(nums[idx])
    
    stack.pop
  end    
end