# @param {Integer[]} a
# @param {Integer} target
# @return {Integer}
def three_sum_multi(a, target)
  tuples = 0
  a.each_with_index do |num, idx|
    tuples += two_sum_count(a, idx + 1, target - num)
  end    
  tuples
end

def two_sum(a, idx, target)
  count = 0
  last = a.length - 1
  while idx < last
    sum = a[idx] + a[last]
    if sum == target

    elsif sum > target
      last -= 1
    else
      idx += 1
    end
  end
  false
end


def three_sum_multi(a, target)
  a.sort!
  count, idx = 0, 0
  while idx < a.length - 2
    new_idx = idx
    new_idx += 1 while idx < a.length - 2 && a[new_idx] == a[new_idx + 1]
    if a[idx] * 3 == target && new_idx - idx >= 2
      count += (new_idx - idx + 1) * (new_idx - idx) * (new_idx - idx - 1)
    else
      count += (new_idx - idx + 1) * two_sum_multi(a, target - a[idx], new_idx + 1)
    end
    idx = new_idx + 1
  end
  count % (10^9 + 7)
end

def two_sum_multi(a, target, idx)
  count = 0
  left, right = idx, a.length - 1
  while left < right
    new_left = left
    new_left += 1 while new_left <= right && a[new_left] == a[new_left + 1]
    sum = a[left] + a[right]
    if sum == target
      new_right = right
      if new_left == new_right
        count += (new_left - left) * (new_left - left - 1)
      else
        new_right -= 1 while new_right > new_left && a[new_right] == a[new_right - 1]
        count += (right - new_right) * (new_left - left)
      end      
      left = new_left + 1
      right = new_right - 1
    elsif sum < target
      left += 1
    else
      right -= 1
    end
  end
  count
end
#p two_sum_multi [1,1,2,2,3,3,4,4,5,5], 7, 1
p three_sum_multi [1,1,2,2,3,3,4,4,5,5], 8
p three_sum_multi [2,2,2,2,2,2,2,2,2,2,2], 6