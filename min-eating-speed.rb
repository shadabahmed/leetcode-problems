# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}

# def bin_search(nums, x, first = 0, last = nums.size - 1)
#   return last if first > last
#   mid = (first + last) / 2
#   if nums[mid] == x
#     mid
#   elsif nums[mid] > x
#     bin_search(nums, x, first, mid - 1)
#   else
#     bin_search(nums, x, mid + 1, last)
#   end
# end

# def time_for_speed(nums, speed, h)
#   start_idx, hours, multiplier = 0, 0, 1
#   while start_idx < nums.size
#     idx = bin_search(nums, multiplier * speed, start_idx)
#     hours += (idx - start_idx + 1) * multiplier
#     return hours if hours > h
#     multiplier += 1
#     start_idx = idx + 1
#   end
#   hours
# end

# def min_eating_speed(piles, h)
#   max = piles.max
#   return max if h == piles.size
#   min_speed = (piles.sum.to_f / h).ceil
#   max_speed = max
#   max.downto(min_speed) do |speed|
#     return prev_speed if time_for_speed(piles, speed, h) > h
#     prev_speed = speed
#   end
#   prev_speed
# end

def get_time(pile, speed, h)
  hours = 0
  pile.each do |num|
    hours += num / speed
    hours += 1 if num % speed > 0
    return hours if hours > h
  end
  hours
end

def min_eating_speed(piles, h)
  min_speed = (piles.sum.to_f / h).ceil
  max_speed = piles.max
  last_speed = max_speed
  while max_speed >= min_speed
    speed = (min_speed + max_speed) / 2
    time = get_time(piles, speed, h)
    if time > h
      min_speed = speed + 1
    elsif time <= h
      last_speed = speed
      max_speed = speed - 1
    end
  end
  last_speed
end

p min_eating_speed [3, 6, 7, 11], 8
p min_eating_speed [30, 11, 23, 4, 20], 5
p min_eating_speed [30, 11, 23, 4, 20], 6

#p time_for_speed [3, 6, 7, 11], 4, 6
