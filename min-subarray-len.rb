require 'pry'
def min_sub_array_len(s, nums)
    left, right, sum = 0, 0, nums.first
    min_len = nums.size + 1
    while left < nums.length && right < nums.length
        if sum >= s
          len = right - left + 1
          min_len = len if len < min_len
        end
        if sum < s
          right += 1
          sum += nums[right] if right < nums.length
        else
          sum -= nums[left]
          left += 1
        end
    end
    min_len > nums.size ? 0 : min_len
end

min_sub_array_len 7, [2,3,1,2,4,3]
