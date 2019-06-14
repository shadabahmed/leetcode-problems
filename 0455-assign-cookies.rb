# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)  
  s_idx, g_idx = 0, 0
  g.sort!
  s.sort! 
  while s_idx < s.length && g_idx < g.length
    g_idx += 1 if g[g_idx] <= s[s_idx]
    s_idx += 1    
  end
  g_idx
end

p find_content_children [1,2,2,2], [1,1,1,1,1,1,2]