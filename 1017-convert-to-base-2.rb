# @param {Integer} n
# @return {String}
def base_neg2(num)
  s, max_num = get_only_positive_bits(num)  
  0.upto(s.length - 1) do |idx|
    break if max_num == num
    current_power = 2 ** (s.length - 1 - idx)
    if max_num - current_power >= num
      s[idx] = idx.even? ? '0' : '1'
      max_num -= current_power
    end    
  end
  s
end

def get_only_positive_bits(num)
  base, sum = 1, 0
  s = ''
  multiplier = 1
  while sum < num
    s = s + multiplier.to_s
    sum += base * multiplier
    base *= 2
    multiplier = multiplier.zero? ? 1 : 0
  end
  [s.empty? ? '0' : s, sum]
end

p base_neg2 2
p base_neg2 3
p base_neg2 4
p base_neg2 5
p base_neg2 7
p base_neg2 0

