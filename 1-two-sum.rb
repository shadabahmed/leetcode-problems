# https://leetcode.com/problems/two-sum/

def two_sum(numbers, target)
  first, last = 0, numbers.length - 1
  while first < last
    sum = numbers[first] + numbers[last]
    return [first + 1, last + 1] if sum == target
    if sum > target
      last -= 1
    else
      first += 1
    end
  end
  nil
end
