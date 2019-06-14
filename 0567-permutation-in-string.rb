# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  return false if s1.length > s2.length
  s1_map, s2_map = Hash.new(0), Hash.new(0)
  last_match_indices = {}
  0.upto(s1.length - 1) do |idx|
    s1_map[s1[idx]] += 1
    s2_map[s2[idx]] += 1
  end
  idx = s1.length - 1
  while idx < s2.length
    if idx >= s1.length
      prev = s2[idx - s1.length]
      current = s2[idx]
      s2_map[prev] -= 1
      s2_map.delete(prev) if s2_map[prev].zero?
      s2_map[current] += 1
    end
    return true if match?(s1_map, s2_map)
    idx += 1
  end
  false
end

def match?(s1_map, s2_map)
  return false unless s1_map.length == s2_map.length
  s1_map.each do |c, count|
    return false if s2_map[c] != count
  end
  true
end
