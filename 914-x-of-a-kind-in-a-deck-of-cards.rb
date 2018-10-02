# @param {Integer[]} deck
# @return {Boolean}
def has_groups_size_x(deck)
  return false if deck.empty?
  count_map = Hash.new(0)
  deck.each do |num|
    count_map[num] += 1    
  end
  values = count_map.values
  return values.first >= 2 if values.size < 2
  min, second_min = values[0], values[1]
  1.upto(values.length - 1) do |idx|
    if values[idx] < min
      second_min = min
      min = values[idx]
    elsif values[idx] > min && values[idx] < second_min
      second_min = values[idx]
    end
  end
  factor = gcd(min, second_min)
  factor >= 2 && values.all?{|k| k % factor == 0}
end

def gcd(a, b)
  while a != b 
    if a > b
      a -= b
    else
      b -= a
    end
  end        
  a
end
p has_groups_size_x [1,2,3,4,4,3,2,1]
p has_groups_size_x [1,1,1,2,2,2,3,3]
p has_groups_size_x [1,1,2,2,2,2]
p has_groups_size_x [1,1,1,1,2,2,2,2,2,2]