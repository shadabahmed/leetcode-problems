# @param {Integer[]} prices
# @return {Integer}
INFINITY = 1.0 / 0
def max_profit(prices)
  max = 0
  min_left = INFINITY
  prices.each_with_index do |price, idx|
    max = price - min_left if price - min_left > max
    min_left = price if min_left > price
  end
  max
end

max_profit [7,6,4,3,1]
