# https://leetcode.com/problems/find-the-celebrity/
def knows(a, b)
  {[0,1] => true, [1,0] => true, [0,2] => true}[[a,b]]
end

# 0 knows 1
# 0 knows 2; 1 knows 0
# 1 does not know 2; 2 does not know 0
# 2 does not know 1.

def find_celebrity(n)
  current = 0
  while true
    next_person = (current + 1) % n
    while next_person != current && !knows(current, next_person)
      next_person = (next_person + 1) % n
    end
    if next_person == current
      0.upto(n - 1) do |other|
        next if other == current
        return -1 unless knows(other, current)
      end
      return current
    end
    break if current == n - 1
    if next_person > current
      current = next_person    
    else
      current += 1
    end    
  end
  -1
end

require 'set'
def find_celebrity(n)
  current = 0
  not_celebs = Set.new
  celeb_map = Hash.new(0)
  0.upto(n - 1) do |j|
    (j + 1).upto(n - 1) do |k|
      next if not_celebs.include?(j) && not_celebs.include?(k)
      if knows(j, k)
        not_celebs << j
        celeb_map.delete(j)
        celeb_map[k] += 1
      end
      if knows(k, j)
        not_celebs << k
        celeb_map.delete(k)
        celeb_map[j] += 1
      end
    end
  end
  celeb_map.each do |celeb, known_by|
    if known_by == n - 1 && !not_celebs.include?(celeb)
      return celeb
    end
  end
  -1
end

p find_celebrity 2