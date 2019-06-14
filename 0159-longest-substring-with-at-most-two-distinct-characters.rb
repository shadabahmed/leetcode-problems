# @param {String} s
# @return {Integer}
def length_of_longest_substring_two_distinct(s)
  left, right, max_length, map = 0, 0, 0, {}
  while left < s.length
    max_length = right - left if right - left > max_length && map.size <= 2
    if map.length <= 2 && right < s.length
      map[s[right]] ||= 0
      map[s[right]] += 1
      right += 1    
    else
      k = s[left]
      map[k] -= 1
      map.delete(k) if map[k].zero?
      left += 1
    end        
  end
  max_length
end

p length_of_longest_substring_two_distinct 'eceba'
p length_of_longest_substring_two_distinct "ccaabbb"