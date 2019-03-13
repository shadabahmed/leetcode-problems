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
  count = 0
  0.upto(a.length - 3) do |idx|
    current_count += two_sum_multi(a, target - a[idx], idx + 1)
  end
  count
end

def two_sum_multi(a, target, idx)
  count = 0
  idx.upto(a.length - 2) do |j|    
    (j + 1).upto(a.length - 1) do |k|
      if a[j] + a[k] == target
        count += 1 
      end      
    end
  end
  count
end
p two_sum_multi [1,1,2,2,3,3,4,4,5,5], 7, 1
p three_sum_multi [1,1,2,2,3,3,4,4,5,5], 8