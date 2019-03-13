# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  subsets(nums.sort)
end


def subsets(nums, idx = 0, stack = [], res = [])
  return res.push(stack.flatten) if idx == nums.length
  dup_length = 1
  while idx + dup_length < nums.length && nums[idx] == nums[idx + dup_length]
    dup_length += 1
  end
  subsets(nums, idx + dup_length, stack, res)
  1.upto(dup_length) do |len|
    stack.push(nums.slice(idx, len))
    subsets(nums, idx + dup_length, stack, res)
    stack.pop
  end
  res
end