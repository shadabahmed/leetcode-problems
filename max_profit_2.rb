def max_profit(prices)
  profit = 0
  1.upto(prices.length - 1) do |idx|
    diff = prices[idx] - prices[idx - 1]
    profit += diff if diff > 0
  end
  profit
end
