# @param {Integer[]} a
# @return {Integer[]}
def sorted_squares(a)
  left, right, idx = 0, a.length - 1, a.length - 1
  res = []
  while left <= right
    if a[left].abs > a[right]
      res[idx] = a[left] * a[left]
      left += 1
    else
      res[idx] = a[right] * a[right]
      right -= 1
    end
    idx -= 1
  end
  res
end

p sorted_squares [-4,-1,0,3,10]
p sorted_squares [-7,-3,2,3,11]