# @param {Integer[]} a
# @return {Boolean}
def valid_mountain_array(a)
  idx = 0
  while idx < a.length - 2 && a[idx] < a[idx + 1] 
    idx += 1
  end
  return false if idx.zero?
  (idx + 1).upto(a.length - 1).all? do |idx|
    a[idx] < a[idx - 1]
  end
end

p valid_mountain_array [3,2,1]