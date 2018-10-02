# @param {Integer[]} a
# @return {Integer}
def partition_disjoint(a)
  left_max = [a[0]]
  1.upto(a.length - 1) do |idx|
    if a[idx] > left_max[idx - 1]
      left_max[idx] = a[idx]
    else
      left_max[idx] = left_max[idx - 1]
    end
  end
  right_min = []
  right_min[a.length - 1] = a.last
  (a.length - 2).downto(0) do |idx|
    if a[idx] < right_min[idx + 1]
      right_min[idx] = a[idx]
    else
      right_min[idx] = right_min[idx + 1]
    end
  end
  idx = 0
  while idx < a.length - 1 && left_max[idx] > right_min[idx + 1]
    idx += 1
  end
  idx + 1
end

p partition_disjoint [5,0,3,8,6]
p partition_disjoint [1,1,1,0,6,12]
p partition_disjoint [1,1]
p partition_disjoint [90,47,69,10,43,92,31,73,61,97]