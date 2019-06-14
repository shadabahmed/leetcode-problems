# @param {Integer[]} a
# @return {Boolean}
def can_reorder_doubled(a)
   a.sort!
   low, high = 0, 1
   while high < a.length
    matching_num = a[low] < 0 ? a[low] / 2 : 2 * a[low]      
      while high < a.length && a[high] != matching_num
        high += 1
      end
      return false if high >= a.length
      high += 1
      low += 1
   end
   low == high / 2
end

p can_reorder_doubled [4,-2,2,-4]
p can_reorder_doubled [1,2,4,16,8,4]
p can_reorder_doubled [0,0]
p can_reorder_doubled [2,1,2,6]