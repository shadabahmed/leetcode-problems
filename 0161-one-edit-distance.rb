# @param {String} s
# @param {String} t
# @return {Boolean}
def is_one_edit_distance(s, t)
  if s.length == t.length    
    is_single_replacement(s, t)
  elsif s.length + 1 == t.length
    is_single_addition(s, t)
  elsif s.length == t.length + 1
    is_single_addition(t,s)
  else
    false
  end
end

def is_single_replacement(s, t)
  replaced = false
  while idx < s.length
    if s[idx] != t[idx]
      return false if replaced
      replaced = true
    end
    idx += 1
  end  
  true
end

def is_single_addition(s, t)
  s_idx, t_idx = 0, 0
  while s_idx < s.length
    if s[s_idx] != t[t_idx]
      return false if s_idx != t_idx
      t_idx += 1
    end
    s_idx += 1
    t_idx += 1
  end  
  true
end

p is_one_edit_distance "ab", "acb"

