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
