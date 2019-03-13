# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)
  stack = []
  idx = s.length - 1
  license_str = []
  len = 0
  while idx >= 0
    chars = 0    
    if s[idx] != '-'
      license_str.unshift(s[idx].ord > 96 ? (s[idx].ord - 32).chr : s[idx])
      len += 1
      if len == k
        license_str.unshift('-')
        len = 0
      end
    end
    idx -= 1
  end
  while license_str[0] == '-'
    license_str.shift
  end
  license_str.join()
end

S = "5F3Z-2e-9-w"
K = 4
p license_key_formatting S, K

p license_key_formatting "--a-a-a-a--", 2