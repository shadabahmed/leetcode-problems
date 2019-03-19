# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  return true if a == b
  b = b + b
  a_idx, b_idx = 0, 0
  while b_idx < b.length
    if a[a_idx] == b[b_idx]
      idx = b_idx
      while a_idx < a.length && idx < b.length && a[a_idx] == b[idx]
        a_idx += 1
        idx += 1
      end
      if a_idx == a.length && idx < b.length
        return true 
      else
        a_idx = 0
      end
    end
    b_idx += 1
  end
  false
end

#p rotate_string a = 'abcde', b = 'abced'
p rotate_string a = 'aa', b = 'a'