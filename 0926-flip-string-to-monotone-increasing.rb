# @param {String} s
# @return {Integer}
def min_flips_mono_incr(s)
  zero_flips = 0
  one_flips = 0
  s.each_char do |c|
    zero_flips += (c == '1' ? 1 : 0)
  end
  min_flips = zero_flips
  (s.length - 1).downto(0) do |idx|
    zero_flips -= (s[idx] == '1' ? 1 : 0)
    one_flips += (s[idx] == '1' ? 0 : 1)
    total_flips = zero_flips + one_flips
    min_flips = total_flips if total_flips < min_flips
  end
  min_flips
end

p min_flips_mono_incr "00110"
p min_flips_mono_incr "010110"
p min_flips_mono_incr "00011000"
p min_flips_mono_incr "0111111111"