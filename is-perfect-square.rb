# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  first, last = 0, num
  while first <= last
    mid = (first + last) / 2
    return true if mid * mid == num
    if mid * mid < num
      first = mid + 1
    else
      last = mid - 1
    end
  end
  false
end

p is_perfect_square 16
p is_perfect_square 14
