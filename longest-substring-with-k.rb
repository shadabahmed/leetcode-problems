def length_of_longest_substring_k_distinct(s, k)
  cache = {}
  left, right = 0, 0
  max_left_idx, max_len = 0, 0
  while left < s.length && right < s.length
    if cache.size > k
      cache[s[left]] -= 1
      cache.delete(s[left]) if cache[s[left]] == 0
      left += 1
    else
      cache[s[right]] ||= 0
      cache[s[right]] += 1
      right += 1
    end
    if cache.size <= k && right - left > max_len
      max_len = right - left
      max_left_idx = left
    end
  end
  s.slice(max_left_idx, max_len)
end

p length_of_longest_substring_k_distinct('eceba', 2)
