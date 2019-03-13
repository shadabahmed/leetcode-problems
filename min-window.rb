require "set"

def min_window(s, t)
  set = Set.new
  t.each_char do |char|
    set.add(char)
  end
  char_map = {}
  left, right = 0, 0
  min = ""
  while left < s.length
    if char_map.length < set.length && right < s.length
      if set.include?(s[right])
        char_map[s[right]] ||= 0
        char_map[s[right]] += 1
      end
      right += 1
    end
    if char_map.length == set.length
      min = s[left..right] if min == "" || min.length > right - left
      if set.include?(s[left])
        char_map[s[left]] -= 1
        char_map.delete(s[left]) if char_map[s[left]] == 0
      end
      left += 1
    elsif right == s.length
      break
    end
  end
  min
end

require "set"

def min_window(s, t)
  control_map, char_map = Hash.new(0), Hash.new(0)
  t.each_char do |c|
    control_map[c] += 1
    char_map[c] += 1
  end
  left, right = 0, 0
  min = ""
  chars = 0
  while left < s.length
    if chars >= t.length
      if char_map.empty? && (min == "" || min.length >= right - left)
        min = s[left..(right - 1)]
      end
      if control_map.key?(s[left])
        chars -= 1
        char_map[s[left]] += 1
        char_map.delete(s[left]) if char_map[s[left]].zero?
      end
      left += 1
    elsif right < s.length
      if control_map.key?(s[right])
        chars += 1
        if char_map[s[right]] > 0
          char_map[s[right]] -= 1
          char_map.delete(s[right]) if char_map[s[right]].zero?
        end
      end
      right += 1
    elsif right == s.length
      break
    end
  end
  min
end

require "set"

def min_window(s, t)
  control_map, char_map = Hash.new(0), Hash.new(0)
  t.each_char do |c|
    control_map[c] += 1
    control_map["#{c}#{control_map[c]}"] = 1
  end
  left, right, min = 0, 0, ""
  while left < s.length
    if char_map.length == control_map.length
      min = s[left..(right - 1)] if min.empty? || min.length >= right - left
      char = s[left]
      if control_map.key?(char)
        char_map.delete("#{char}#{char_map[char]}")
        char_map[char] -= 1
        char_map.delete(char) if char_map[char].zero?
      end
      left += 1
    elsif right < s.length
      char = s[right]
      if control_map.key?(char)
        char_map[char] += 1
        if char_map[char] <= control_map[char]
          char_map["#{char}#{char_map[char]}"] = 1
        end
      end
      right += 1
    else
      break
    end
  end
  min
end

p min_window "ADOBECODEBANC", "ABC"
p min_window "a", "aa"
p min_window "aaaaaaaaaaaabbbbbcdd", "abcdd"
