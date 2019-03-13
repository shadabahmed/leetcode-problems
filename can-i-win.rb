# @param {Integer} max_choosable_integer
# @param {Integer} desired_total
# @return {Boolean}

def can_i_win(max_choosable_integer, desired_total, choice = {})
  return true if desired_total <= max_choosable_integer
  1.upto(max_choosable_integer).any? do |num|
    next if choice[num]
    choice[num] = true
    return true if !can_i_win(max_choosable_integer, desired_total - num, choice)
    choice[num] = false
  end
  false
end

def can_i_win(max_choosable_integer, desired_total)
  return true if desired_total <= max_choosable_integer
  dp_size = max_choosable_integer + 1
  map = {}
  0.upto(dp_size) {|idx| map[idx] = idx}
  (max_choosable_integer + 1).upto(desired_total) do |num|
    arr[num % dp_size] = 0
    1.upto(max_choosable_integer) do |choice|
      if map[(num - choice) % dp_size] != choice
        numbers_chosen[choice]
        arr[num % dp_size] = true
      end
    end
  end
  p numbers_chosen
  arr[desired_total % dp_size]
end
can_i_win 10, 11
