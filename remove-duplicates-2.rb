# find next start and next end ... copy at most 2 elements to index position
def find_last_index(nums, idx)
  while idx < nums.length - 1 && nums[idx] == nums[idx + 1]
    idx += 1
  end
  idx
end

def remove_duplicates(nums)
  return 0 if nums.empty?
  idx = 0
  next_start, next_end = 0, find_last_index(nums, 0)
  while next_end < nums.length
    next_num_count = [next_end - next_start + 1, 2].min
    next_num_count.times do
      nums[idx] = nums[next_start]
      idx += 1
    end
    next_start, next_end = next_end + 1, find_last_index(nums, next_end + 1)
  end
  idx
end

remove_duplicates [1,1,1,2,2,2,2,2,2,2,3]
