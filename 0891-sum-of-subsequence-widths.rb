# @param {Integer[]} a
# @return {Integer}
def sum_subseq_widths(a)
  res = []
  a.each_with_index do |num, idx|
    get_sum(a, idx + 1, num, num, res) 
  end
  res.sum
end

def get_sum(a, idx, min, max, res = [])
  return res.push(max - min) if idx >= a.length
  get_sum(a, idx + 1, min, max, res) 
  get_sum(a, idx + 1, [a[idx], min].min, [a[idx], max].max, res)
  res
end

# @param {Integer[]} a
# @return {Integer}
def sum_subseq_widths(a)
  1.upto(a.length) do |len|
    first, last = 0, 0
    while last < a.len
      min = a[first]
      last = a[first]
      first.upto(last) do š||
      end
    end
  end
end 



p sum_subseq_widths [2,1,3]