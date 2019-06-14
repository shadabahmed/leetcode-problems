# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  dp = [0]
  1.upto(amount) do |amount|
    min = nil
    coins.each do |c|
      next if c > amount || dp[amount - c].nil?
      if min.nil? || dp[amount - c] < min
        min = dp[amount - c] + 1
      end
    end
    dp[amount] = min
  end  
  dp[amount] || - 1
end
INF = 1.0 / 0




#p coin_change coins = [1, 2, 5], amount = 11
p coin_change coins = [2], amount = 3