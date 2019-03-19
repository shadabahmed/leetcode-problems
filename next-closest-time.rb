# @param {String} time
# @return {String}
def next_closest_time(time)
  sorted = get_sorted_nums(time)
  idx = 4
  while idx >= 0
    new_digit = search_next_digit(time, idx, sorted)
    if new_digit
      time[idx] = new_digit.to_s
      break
    else
      time[idx] = sorted[0].to_s
    end
    if idx == 3
      idx = 1
    else
      idx -= 1
    end
  end
  time
end

def search_next_digit(time, idx, sorted)
  digit = time[idx].ord - 48
  search_idx = get_rightmost_index(sorted, digit)
  return if search_idx == 3
  next_num = if idx == 4
               sorted[search_idx + 1]
             elsif idx == 3 && sorted[search_idx + 1] < 6
               sorted[search_idx + 1]
             elsif idx == 1 && (time[0] == "2" && sorted[search_idx + 1] < 4 || time[0] != "2")
               sorted[search_idx + 1]
             elsif idx == 0 && sorted[search_idx + 1] < 3
               sorted[search_idx + 1]
             end
  next_num
end

def get_sorted_nums(time)
  time.sub(":", "").chars.collect(&:to_i).sort
end

def get_rightmost_index(nums, key)
  first, last = 0, nums.length - 1
  while first < last
    mid = (first + last) / 2
    if nums[mid] == key
      if nums[mid + 1] != key
        return mid
      else
        first = mid + 1
      end
    elsif nums[mid] > key
      last = mid - 1
    else
      first = mid + 1
    end
  end
  nums[first] == key ? first : nil
end

p next_closest_time("23:59")
p next_closest_time("13:55")
p next_closest_time("20:48")

#p get_rightmost_index([1, 2, 2, 2, 3, 3], 3)

# @param {String} time
# @return {String}
def next_closest_time(time)
  digits = []
  time.each_char do |x|
    digits << x.ord - 48 if x != ':'
  end
  digits.sort!
  digit_changed = -1
  (time.length - 1).downto(0) do |idx|
    current_digit = time[idx].ord - 48
    next_digit = get_next_larger_digit(digits, time, current_digit, idx)
    if next_digit != -1
      time[idx] = next_digit.to_s
      digit_changed = idx
      break
    end
  end
  (digit_changed + 1).upto(time.length - 1) do |idx|
    next if time[idx] == ':'
    time[idx] = digits[0].to_s
  end
  time
end

def get_next_larger_digit(digits, time, digit, position)
  digits.each do |other_digit|
    if other_digit > digit
      if position == 4
        return other_digit
      elsif position == 3 && other_digit < 6
        return other_digit
      elsif position == 1 && (time[0] != '2' || other_digit < 4)
        return other_digit
      elsif position == 0 && other_digit < 3
        return other_digit
      end
    end
  end
  -1
end

# p next_closest_time '12:22'
p next_closest_time '23:59'
#p next_closest_time '13:55'