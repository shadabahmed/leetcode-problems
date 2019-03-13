# @param {Integer[]} answers
# @return {Integer}
def num_rabbits(answers)
  map = {}
  total = 0
  answers.each do |count|
    count += 1
    if map[count]
      if map[count] == count
        total += count
        map.delete(count)
        map[count] = 1
      else
        map[count] += 1
      end      
    else
      map[count] = 1
    end
  end
  total + map.keys.sum
end

p num_rabbits [1,0,1,0,0]