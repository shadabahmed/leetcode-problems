# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def smallest_range_i(a, k)
  largest, smallest = a[0], a[0]
  1.upto(a.length - 1) do |idx|
    largest = a[idx] if a[idx] > largest
    smallest = a[idx] if a[idx] < smallest
  end
  if largest - smallest > 2 * k
    largest - smallest - 2 * k
  else
    0 
  end
end

p smallest_range_i [1], 0
p smallest_range_i [0,10], 2