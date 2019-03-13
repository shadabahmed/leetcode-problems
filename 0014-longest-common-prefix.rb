def find_in_trie(str, root)
  parent = root
  0.upto(str.length - 1) do |idx|
    return idx unless parent.key?(str[idx])
    parent = parent[str[idx]]
  end
  str.length
end

def build_trie(str)
  root = {}
  parent = root
  0.upto(str.length - 1) do |idx|
    parent[str[idx]] = {}
    parent = parent[str[idx]]
  end
  root
end

def find_match_len(str1, str2, max_match_length)
  return 0 if str2.empty?
  idx = 0
  while idx < max_match_length && idx < str2.length
    return idx if str1[idx] != str2[idx]
    idx += 1
  end
  [str2.length, max_match_length].min
end

def longest_common_prefix(strs)
  return '' if strs.empty?
  first_str = strs.first
  #trie = build_trie(first_str)
  max_match_length = first_str.length
  1.upto(strs.length - 1) do |idx|
    cur_match_len = find_match_len(first_str, strs[idx], max_match_length)
    max_match_length = cur_match_len if cur_match_len < max_match_length
  end
  first_str.slice(0, max_match_length)
end
