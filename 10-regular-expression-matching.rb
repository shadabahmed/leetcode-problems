# https://leetcode.com/problems/regular-expression-matching/

def is_match(s, p)
  dp = (p.length + 1).times.collect{ (s.length + 1).times.collect { false }}
  dp[0][0] = true
  s_len_start = 0
  1.upto(p.length) do |p_len|
    next if p_len < p.length && p[p_len] == '*'
    0.upto(s.length) do |s_len|
      if p[p_len - 1] != '*'
        next if s_len == 0
        current_char_match = p[p_len - 1] == '.' || p[p_len - 1] == s[s_len - 1]
        dp[p_len][s_len] = dp[p_len - 1][s_len - 1] && current_char_match
      else
        if s_len == 0
          dp[p_len][s_len] = dp[p_len - 2][s_len]
        else
          last_char = p[p_len - 2]
          current_char_match = last_char == '.' || last_char == s[s_len - 1]
          dp[p_len][s_len] = dp[p_len - 2][s_len] || (dp[p_len][s_len - 1] && current_char_match)
        end
      end
    end
  end
  dp[p.length][s.length]
end
is_match "a", ".*..a*"
