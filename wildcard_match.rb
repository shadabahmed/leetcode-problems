def is_match(s, p, s_idx = 0, p_idx = 0)
  return true if s_idx == s.length && p_idx == p.length
  return true if s_idx >= s.length && p_idx.upto(p.length - 1).all? {|p_idx| p[p_idx] == '*'}
  return false if p_idx >= p.length
  if p[p_idx] == '*'
    while p_idx < p.length - 1 && p[p_idx + 1] == '*'
      p_idx += 1
    end
    s.length.downto(s_idx).any? do |s_idx|
      is_match(s, p, s_idx, p_idx + 1)
    end
  elsif s_idx < s.length && p[p_idx] == '?'
    is_match(s, p, s_idx + 1, p_idx + 1)
  elsif s_idx < s.length && p[p_idx] == s[s_idx]
    is_match(s, p, s_idx + 1, p_idx + 1)
  else
    false
  end
end


def is_match(s, p)
  dp = (p.length + 1).times.collect { (s.length + 1).times.collect { false }}
  dp[0][0] = true
  1.upto(p.length) do |p_len|
    0.upto(s.length) do |s_len|
      if p[p_len - 1] == '?'
        dp[p_len][s_len] = dp[p_len - 1][s_len - 1] if s_len > 0
      elsif p[p_len - 1] != '*'
        dp[p_len][s_len] = dp[p_len - 1][s_len - 1] && p[p_len - 1] == s[s_len - 1] if s_len > 0
      else
        dp[p_len][s_len] = dp[p_len - 1][s_len]
        dp[p_len][s_len] ||= dp[p_len][s_len - 1] if s_len == 0
      end
    end
  end
  dp[p.length][s.length]
end
is_match "adceb", "*a*b"
is_match "abbaabbbbababaababababbabbbaaaabbbbaaabbbabaabbbbbabbbbabbabbaaabaaaabbbbbbaaabbabbbbababbbaaabbabbabb" ,"***b**a*a*b***b*a*b*bbb**baa*bba**b**bb***b*a*aab*a**"
