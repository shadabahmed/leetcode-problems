# @param {String[]} a
# @return {Integer}
def min_deletion_size(a)
  count = 0
  return count if a.empty?  
  0.upto(a.first.length - 1) do |col|
    count += 1 if non_non_decreasing?(a, col)
  end
  count
end

def non_non_decreasing?(a, col)
  1.upto(a.length - 1) do |idx|
    return true if a[idx][col] < a[idx - 1][col]
  end
  false
end

p min_deletion_size ["cba","daf","ghi"]