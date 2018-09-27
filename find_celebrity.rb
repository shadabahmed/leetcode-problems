def knows(a, b)
  {[0,1] => true, [1,0] => true, [0,2] => true}[[a,b]]
end

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

p find_celebrity 100