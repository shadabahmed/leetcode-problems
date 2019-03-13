# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 0 if x.zero?
  left, right = 1, x
  while left <= right
    mid = (left + right) / 2
    if x / mid > mid
      return mid if x / (mid + 1) < mid + 1
      left = mid + 1
    elsif x / mid < mid      
      right = mid - 1
    else
      return mid
    end
  end
end

p my_sqrt(14)
