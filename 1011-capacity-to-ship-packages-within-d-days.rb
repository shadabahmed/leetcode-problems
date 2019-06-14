# @param {Integer[]} weights
# @param {Integer} d
# @return {Integer}
def ship_within_days(weights, d)
  min_weight = weights.max
  max_weight = weights.sum
  while min_weight <= max_weight
    mid = (min_weight + max_weight) / 2
    if can_ship?(weights, d, mid)
      max_weight = mid - 1
    else
      min_weight = mid + 1
    end
  end
  min_weight
end

def can_ship?(weights, d, max_weight)
  current_weight = 0
  d -= 1
  weights.each do |weight|
    if current_weight + weight <= max_weight
      current_weight += weight
    else
      d -= 1
      current_weight = weight
    end
  end
  d >= 0
end

p ship_within_days weights = [1,2,3,4,5,6,7,8,9,10], d = 5
p ship_within_days [3,2,2,4,1,4], 3
p ship_within_days [1,2,3,1,1], 4