def max_profit(prices)
  profit = 0
  1.upto(prices.length - 1) do |idx|
    diff = prices[idx] - prices[idx - 1]
    profit += diff if diff > 0
  end
  profit
end


# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  dq, max_profit = [], 0
  1.upto(prices.length - 1) do |idx|
    dq.pop while !dq.empty? && prices[dq.last] < prices[idx]
    dq << idx
  end 
  0.upto(prices.length - 2) do |idx|
    dq.shift while !dq.empty? && dq.first <= idx
    if !dq.empty? && prices[dq.first] > prices[idx]
      profit = prices[dq.first] - prices[idx]
      max_profit = profit if profit > max_profit
    end
  end
  max_profit
end

p max_profit [7,1,5,3,6,4]
p max_profit [7,6,4,3,1]