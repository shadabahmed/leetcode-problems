# @param {Integer} target
# @param {Integer[]} position
# @param {Integer[]} speed
# @return {Integer}
def car_fleet(target, position, speed)
  speed = speed.each_with_index.sort_by{|x, idx| position[idx]}.collect(&:first)
  position.sort!
  idx = position.length - 1
  fleets = 0
  while idx >= 0
    time = (target - position[idx]).to_f / speed[idx]
    idx -= 1
    while idx >= 0 && position[idx] + speed[idx] * time >= target
      idx -= 1
    end
    fleets += 1
  end
  fleets
end

#p car_fleet target = 12, position = [10,8,0,5,3], speed = [2,4,1,1,3]

p car_fleet 17, [8,12,16,11,7], [6,9,10,9,7]