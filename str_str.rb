def str_str(haystack, needle)
  return -1 if haystack.empty? || needle.empty?
  needle_idx = 0
  0.upto(haystack.length - needle.length) do |idx|
    0.upto(needle.length - 1) do |n_idx|
      if haystack[idx] == needle[n_idx]
        return idx - n_idx if n_idx == needle.length - 1
        idx += 1
      else
        break
      end
    end
  end
  -1
end


# If chars match then advance both i and j. If not then update j from match table if j != 0
def str_str(text, pattern)
  return if pattern.empty?
  i = 0
  j = 0
  pmt = partial_match_table(pattern)
  while i < text.length
    if text[i] == pattern[j]
      i += 1
      j += 1
      return i - j if j == pattern.length
    else
      if j == 0
        i += 1
      else
        j = pmt[j - 1]
      end
    end
  end
  -1
end

# This table creates a lookup on how much to jump if the match isnt successfull. If the string has not repeating subpattern then most likely jump would be match length
# But if the string has a suffix similar to prefix, then we move the first letter index to the same part of substring where the suffix matched
def partial_match_table(str)
  pmt = [0]
  len = 0
  l = 1
  while l < str.length
    if str[l] == str[len]
      len += 1
      pmt[l] = len
      l += 1
    else
      if len != 0
        len = pmt[len - 1]
      else
        pmt[l] = 0
        l += 1
      end
    end
  end
  pmt
end

str_str 'ababac', 'bab'
str_str "mississippi", "issip"
