# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer[][]}
def interval_intersection(a, b)
  res = []
  while !a.empty? && !b.empty?
    if (a.first.first >= b.first.first && a.first.first <= b.first.last) || (b.first.first >= a.first.first && b.first.first <= a.first.last)
      res << [[a.first.first, b.first.first].max, [a.first.last, b.first.last].min]
    end
    if a.first.last < b.first.last
      a.shift
    else
      b.shift
    end
  end
  res
end

# p interval_intersection  [[0,2],[5,10],[13,23],[24,25]], [[1,5],[8,12],[15,24],[25,26]]

# p interval_intersection [[5,10]], [[5,6]]
# p interval_intersection [[8,15]],[[2,6],[8,10],[12,20]]

p interval_intersection [[3,5],[9,20]], [[4,5],[7,10],[11,12],[14,15],[16,20]]