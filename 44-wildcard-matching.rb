# @param {String} s
# @param {String} p
# @return {Boolean}
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
