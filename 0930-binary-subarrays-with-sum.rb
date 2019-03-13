# @param {Integer[]} a
# @param {Integer} s
# @return {Integer}
def num_subarrays_with_sum(a, s)
  map = Hash.new(0)
  sum = 0
  a.each_with_index do |num, idx|
    sum += a[idx] 
    map[sum] += 1
  end
  map[0] = 1
  count = 0
  p map
  0.upto(sum - s) do |num|
    count += map[num] * map[num + s]
  end
  count
end


# def num_subarrays_with_sum(a, s, idx = 0)
#   return 1 if s.zero? && idx == a.length
#   return 0 if s < 0 || idx >= a.length
#   if a[idx] == 1
#     num_subarrays_with_sum(a, s - 1, idx + 1) + num_subarrays_with_sum(a, s, idx + 1)
#   else
#     num_subarrays_with_sum(a, s, idx + 1)
#   end
# end

A = [1,0,1,0,1]
S = 2

A = [0,0,0,0,0]
S = 0
p num_subarrays_with_sum A, S