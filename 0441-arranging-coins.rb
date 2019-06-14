# @param {Integer} n
# @return {Integer}
def arrange_coins(n)
  steps = 0
  1.upto(n) do |k|
    if n >= k
      n -= k
      steps += 1
    else
      break
    end
  end
  steps
end

p arrange_coins 5
p arrange_coins 8