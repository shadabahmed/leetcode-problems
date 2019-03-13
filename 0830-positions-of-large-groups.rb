# @param {String} s
# @return {Integer[][]}
def large_group_positions(s)
  idx, res = 0, []
  while idx < s.length
    next_letter_idx = get_next_idx(s, idx)
    if next_letter_idx - idx >= 3
      res << [idx, next_letter_idx - 1]
    end
    idx = next_letter_idx
  end
  res 
end

def get_next_idx(s, idx)
  original_idx = idx
  idx += 1 while idx < s.length && s[idx] == s[original_idx]
  idx
end