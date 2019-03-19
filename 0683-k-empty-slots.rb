# @param {Integer[]} flowers
# @param {Integer} k
# @return {Integer}
def k_empty_slots(flowers, k)
  bloomed = []
  flowers.each_with_index do |position, blooming_day|
    k_more_position = position + k + 1
    k_less_positon = position - k - 1
    if k_more_position <= flowers.length && bloomed[k_more_position]
      if !(position + 1).upto(k_more_position - 1).any?{|pos| bloomed[pos]}
        return blooming_day + 1
      end
    end
    if k_less_positon >= 0 && bloomed[k_less_positon]
      if !(k_less_positon + 1).upto(position - 1).any?{|pos| bloomed[pos]}
        return blooming_day + 1
      end
    end
    bloomed[position] = true    
  end
  -1
end 

#p k_empty_slots flowers= [1,3,2], k= 1

#p k_empty_slots  [6,5,8,9,7,1,10,2,3,4],2

p k_empty_slots [10,1,9,3,5,7,6,4,8,2], 8