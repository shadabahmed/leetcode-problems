# @param {Integer[]} a
# @param {Integer[][]} queries
# @return {Integer[]}
def sum_even_after_queries(a, queries)
  sum = a.select{|x| x % 2 == 0}.sum
  res = []
  queries.each do |val, idx|
    if a[idx].even?
      if val.even?
        sum += val
      else
        sum -= a[idx]
      end      
    elsif a[idx].odd? && val.odd?
      sum += val + a[idx]  
    end
    a[idx] += val
    res << sum
  end
  res
end

p sum_even_after_queries [1,2,3,4], [[1,0],[-3,1],[-4,0],[2,3]]