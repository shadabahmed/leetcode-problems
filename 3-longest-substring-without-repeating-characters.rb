# https://leetcode.com/problems/longest-substring-without-repeating-characters/

def length_of_longest_substring(s)
  map, left, right, max_len = {}, 0, 0, 0
  while right < s.length
    if map.key?(s[right])
      prev_idx = map[s[right]]
      left.upto(prev_idx) do |idx|
        map.delete(s[idx])
      end
      map[s[right]] = right
      left = prev_idx + 1
    else
      map[s[right]] = right
    end
    right += 1
    cur_length = right - left
    max_len = cur_length if max_len < cur_length
  end
  max_len
end

length_of_longest_substring "abcabcbb"
