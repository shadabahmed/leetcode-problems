# @param {Integer[]} a
# @return {Boolean[]}
def prefixes_div_by5(a)
  num = 0
  multiplier = 1
  res = []
  (a.length - 1).downto(0) do |idx|
    num += a[idx] * multiplier
    multiplier *= 2
  end
  (a.length - 1).downto(0) do |idx|
    res[idx] = num % 5 == 0
    num /= 2
  end
  res
end

p prefixes_div_by5([0,1,1])