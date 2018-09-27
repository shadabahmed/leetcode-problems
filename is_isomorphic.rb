def is_isomorphic(s, t)
  map = {}
  rev_map = {}
  0.upto(s.length - 1) do |idx|
    binding.pry
    if map.key?(s[idx])
      return false if map[s[idx]] != t[idx]
    else
      return false if rev_map.key?(t[idx])
      map[s[idx]] = t[idx]
      rev_map[t[idx]] = s[idx]
    end
  end
  true
end

is_isomorphic 'ab', 'aa'
